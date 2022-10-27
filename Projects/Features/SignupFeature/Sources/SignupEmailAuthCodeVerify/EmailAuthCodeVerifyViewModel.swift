import BaseFeature
import Combine
import DomainModule
import ErrorModule
import Foundation

final class SignupEmailAuthCodeVerifyViewModel: BaseViewModel {
    @Published var authCode = "" {
        didSet { isErrorOcuured = false }
    }
    @Published var timeRemaining = 180
    @Published var isShowingToast = false
    @Published var toastMessage = ""
    @Published var isNavigateSignupID = false
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var timeText: String {
        timeRemaining % 60 < 10 ?
            "\(timeRemaining/60):0\(timeRemaining%60)" :
            "\(timeRemaining/60):\(timeRemaining%60)"
    }

    private let sendAuthCodeUseCase: any SendAuthCodeUseCase
    private let verifyAuthCodeUseCase: any VerifyAuthCodeUseCase
    let signupEmailAuthCodeVerifyParam: SignupEmailAuthCodeVerifyParam

    init(
        sendAuthCodeUseCase: any SendAuthCodeUseCase,
        verifyAuthCodeUseCase: any VerifyAuthCodeUseCase,
        signupEmailAuthCodeVerifyParam: SignupEmailAuthCodeVerifyParam
    ) {
        self.sendAuthCodeUseCase = sendAuthCodeUseCase
        self.verifyAuthCodeUseCase = verifyAuthCodeUseCase
        self.signupEmailAuthCodeVerifyParam = signupEmailAuthCodeVerifyParam
        super.init()

        addCancellable(
            timer.setFailureType(to: DmsError.self).eraseToAnyPublisher()
        ) { [weak self] _ in
            guard let self, self.timeRemaining > 0 else { return }
            self.timeRemaining -= 1
        }
    }

    func sendEmailAuthCode() {
        addCancellable(
            sendAuthCodeUseCase.execute(
                req: .init(email: signupEmailAuthCodeVerifyParam.email, type: .signup)
            )
        ) { [weak self] _ in
            self?.authCode = ""
            self?.timeRemaining = 180
            self?.toastMessage = "입력하신 이메일로 인증번호가 전송되었습니다."
            self?.isShowingToast = true
        }
    }

    func verifyEmailAuthCode() {
        addCancellable(
            verifyAuthCodeUseCase.execute(
                req: .init(email: signupEmailAuthCodeVerifyParam.email, authCode: authCode, type: .signup)
            )
        ) { [weak self] _ in
            self?.isNavigateSignupID = true
        } onReceiveError: { [weak self] _ in
            self?.authCode = ""
        }
    }
}
