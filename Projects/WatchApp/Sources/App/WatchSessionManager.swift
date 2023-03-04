import Foundation
import WatchConnectivity

final class WatchSessionManager: NSObject, WCSessionDelegate, ObservableObject {
    private let session: WCSession
    static let shared = WatchSessionManager()
    var isRechable: Bool {
        session.activationState == .activated
    }

    private override init() {
        session = .default
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
