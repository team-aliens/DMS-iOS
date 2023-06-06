import DesignSystem
import Foundation
import KeychainModule
import UIKit
import WatchConnectivity
import Firebase
import UserNotifications

final class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate {
    var session: WCSession!
    var keychain: (any Keychain)?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        self.session = .default
        if WCSession.isSupported() {
            session.delegate = self
            session.activate()
        }
        DesignSystemFontFamily.registerAllCustomFonts()

        FirebaseApp.configure()

        if #available(iOS 10.0, *) {
          // For iOS 10 display notification (sent via APNS)
          UNUserNotificationCenter.current().delegate = self

          let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
          UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in }
          )
        } else {
          let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
          application.registerUserNotificationSettings(settings)
        }

        application.registerForRemoteNotifications()
        Messaging.messaging().delegate = self

        return true
    }

    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("fcmToken: \\(fcmToken)")
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      Messaging.messaging().apnsToken = deviceToken
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      Messaging.messaging().apnsToken = deviceToken
    }
    
}

extension AppDelegate: WCSessionDelegate {
    func sessionDidBecomeInactive(_ session: WCSession) { }

    func sessionDidDeactivate(_ session: WCSession) { }

    func session(
        _ session: WCSession,
        didReceiveMessage message: [String: Any],
        replyHandler: @escaping ([String: Any]) -> Void
    ) {
        guard let keychain else {
            return
        }

        let message: [String: Any] = [
            "accessToken": keychain.load(type: .accessToken),
            "accessExpiredAt": keychain.load(type: .accessExpiredAt)
        ]
        replyHandler(message)
    }

    func session(
        _ session: WCSession,
        activationDidCompleteWith activationState: WCSessionActivationState,
        error: Error?
    ) {
        guard let keychain else {
            return
        }

        let message: [String: Any] = [
            "accessToken": keychain.load(type: .accessToken),
            "accessExpiredAt": keychain.load(type: .accessExpiredAt)
        ]
        sendMessage(message: message) { _ in } error: { error in
            print(error.localizedDescription)
        }
    }
}

private extension AppDelegate {
    func sendMessage(
        message: [String: Any],
        reply: @escaping ([String: Any]) -> Void,
        error: ((Error) -> Void)? = nil
    ) {
        guard session.activationState == .activated else {
            return
        }
        session.sendMessage(message, replyHandler: reply, errorHandler: error)
    }
}
