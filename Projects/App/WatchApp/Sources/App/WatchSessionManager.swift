import Foundation
import WatchConnectivity
import WatchRestAPIModule

final class WatchSessionManager: NSObject, WCSessionDelegate, ObservableObject {
    private let session: WCSession
    private let jwtStore: any JwtStore
    var isRechable: Bool {
        session.activationState == .activated
    }

    init(jwtStore: any JwtStore) {
        self.jwtStore = jwtStore
        self.session = .default
        super.init()
        if WCSession.isSupported() {
            session.delegate = self
            session.activate()
        }
    }

    func session(
        _ session: WCSession,
        activationDidCompleteWith activationState: WCSessionActivationState,
        error: Error?
    ) {
        sendMessage(message: [:]) { [weak self] reply in
            guard let self,
                  let accessToken = reply["accessToken"] as? String,
                  let accessExpiredAt = reply["accessExpiredAt"] as? String
            else {
                return
            }
            self.jwtStore.save(type: .accessToken, value: accessToken)
            self.jwtStore.save(type: .accessExpiredAt, value: accessExpiredAt)
        }
    }

    func refresh(completion: @escaping () -> Void) {
        sendMessage(message: [:]) { [weak self] reply in
            guard let self,
                  let accessToken = reply["accessToken"] as? String,
                  let accessExpiredAt = reply["accessExpiredAt"] as? String
            else {
                return
            }
            self.jwtStore.save(type: .accessToken, value: accessToken)
            self.jwtStore.save(type: .accessExpiredAt, value: accessExpiredAt)

            completion()
        }
    }

    func session(
        _ session: WCSession,
        didReceiveMessage message: [String: Any],
        replyHandler: @escaping ([String: Any]) -> Void
    ) {
        guard let accessToken = message["accessToken"] as? String,
              let accessExpiredAt = message["accessExpiredAt"] as? String
        else {
            return
        }
        self.jwtStore.save(type: .accessToken, value: accessToken)
        self.jwtStore.save(type: .accessExpiredAt, value: accessExpiredAt)
    }

    func sessionReachabilityDidChange(_ session: WCSession) {
        guard session.isReachable else { return }
        sendMessage(message: [:]) { [weak self] reply in
            guard let self,
                  let accessToken = reply["accessToken"] as? String,
                  let accessExpiredAt = reply["accessExpiredAt"] as? String
            else {
                return
            }
            self.jwtStore.save(type: .accessToken, value: accessToken)
            self.jwtStore.save(type: .accessExpiredAt, value: accessExpiredAt)
        }
    }

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
