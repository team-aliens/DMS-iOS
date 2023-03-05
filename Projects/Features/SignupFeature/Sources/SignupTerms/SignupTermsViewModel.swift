import BaseFeature
import Combine
import DomainModule

final class SignupTermsViewModel: BaseViewModel {
    @Published var isAgreeTerms = false
    @Published var isShowingAlert = false
    @Published var alertMessage = ""

    private let signupUseCase: any SignupUseCase
    let signupTermsParam: SignupTermsParam

    init(
        signupUseCase: any SignupUseCase,
        signupTermsParam: SignupTermsParam
    ) {
        self.signupUseCase = signupUseCase
        self.signupTermsParam = signupTermsParam
    }

    func confirmButtonDidTap() {
        addCancellable(
            signupUseCase.execute(
                req: .init(
                    schoolCode: signupTermsParam.schoolCode,
                    schoolAnswer: signupTermsParam.schoolAnswer,
                    email: signupTermsParam.email,
                    authCode: signupTermsParam.authCode,
                    grade: signupTermsParam.grade,
                    classRoom: signupTermsParam.class,
                    number: signupTermsParam.number,
                    accountID: signupTermsParam.accountID,
                    password: signupTermsParam.password,
                    profileImageUrl: signupTermsParam.profileImageURLString
                )
            )
        ) { [weak self] _ in
            self?.isShowingAlert = true
            self?.alertMessage = "회원가입이 완료되었습니다!"
        }
    }
}
