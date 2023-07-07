import UIKit
import BaseFeature
import AuthDomainInterface
import NotificationDomainInterface
import Firebase
import FirebaseMessaging

final class SplashViewModel: BaseViewModel {
    private let reissueTokenUseCase: any ReissueTokenUseCase
    private let postDeviceTokenUseCase: any PostDeviceTokenUseCase

    public init(
        reissueTokenUseCase: any ReissueTokenUseCase,
        postDeviceTokenUseCase: any PostDeviceTokenUseCase
    ) {
        self.reissueTokenUseCase = reissueTokenUseCase
        self.postDeviceTokenUseCase = postDeviceTokenUseCase
    }

    func onAppear(
        receiveData: @escaping (SigninDmsFeatures) -> Void,
        onError: @escaping (Error) -> Void
    ) {
        addCancellable(reissueTokenUseCase.execute()) { features in
            receiveData(features)
        } onReceiveError: { error in
            onError(error)
        }
    }

    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
//        print("FCM TOKEN WILL BE SENT")
        print("FCM TOKEN: " + (fcmToken ?? "nothing"))
        addCancellable(
            postDeviceTokenUseCase.execute(token: fcmToken ?? "")
        ) { _ in
            print("Device Token was successly posted.")
        }
    }
}
