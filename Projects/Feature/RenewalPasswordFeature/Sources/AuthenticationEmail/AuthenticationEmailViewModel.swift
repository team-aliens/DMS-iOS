import BaseFeature
import RenewalPasswordFeatureInterface
import Combine
import AuthDomainInterface
import Foundation

final class AuthenticationEmailViewModel: BaseViewModel {
    @Published var authCode = "" {
        didSet { isErrorOcuured = false }
    }
    @Published var timeRemaining = 0
    @Published var isShowingToast = false
    @Published var toastMessage = ""
    @Published var isNavigateChangePassword = false
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var isVerifyEnable: Bool {
        authCode.count == 6
    }
    var timeText: String {
        timeRemaining % 60 < 10 ?
            "\(timeRemaining/60):0\(timeRemaining%60)" :
            "\(timeRemaining/60):\(timeRemaining%60)"
    }

    private let sendAuthCodeUseCase: any SendAuthCodeUseCase
    private let verifyAuthCodeUseCase: any VerifyAuthCodeUseCase
    let authenticationEmailParam: AuthenticationEmailParam

    init(
        sendAuthCodeUseCase: any SendAuthCodeUseCase,
        verifyAuthCodeUseCase: any VerifyAuthCodeUseCase,
        authenticationEmailParam: AuthenticationEmailParam
    ) {
        self.sendAuthCodeUseCase = sendAuthCodeUseCase
        self.verifyAuthCodeUseCase = verifyAuthCodeUseCase
        self.authenticationEmailParam = authenticationEmailParam
        super.init()

        addCancellable(
            timer.setFailureType(to: Error.self).eraseToAnyPublisher()
        ) { [weak self] _ in
            guard let self, self.timeRemaining > 0 else { return }
            self.timeRemaining -= 1
        }
    }

    func sendEmailAuthCode() {
        addCancellable(
            sendAuthCodeUseCase.execute(
                req: .init(email: authenticationEmailParam.email, type: .password)
            )
        ) { [weak self] _ in
            self?.authCode = ""
            self?.timeRemaining = 180
            self?.toastMessage = "입력하신 이메일로 인증번호가 전송되었습니다."
            self?.isShowingToast = true
        }
    }

    func verifyEmailAuthCode() {
        let email = authenticationEmailParam.email
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        addCancellable(
            verifyAuthCodeUseCase.execute(
                req: .init(email: email, authCode: authCode, type: .password)
            )
        ) { [weak self] _ in
            self?.isNavigateChangePassword = true
        } onReceiveError: { [weak self] _ in
            self?.authCode = ""
        }
    }
}
