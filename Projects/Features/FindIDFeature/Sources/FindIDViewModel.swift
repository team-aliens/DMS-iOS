import BaseFeature
import Combine
import DomainModule

final class FIndIDViewModel: BaseViewModel {

    @Published var schoolID = ""
    @Published var name = ""
    @Published var grade = ""
    @Published var classRoom = ""
    @Published var number = ""

    @Published var schoolList =  [
        "대덕소프트웨어마이스터고등학교",
        "대구소프트웨어마이스터고등학교",
        "광주소프트웨어마이스터고등학교",
        "부산소프트웨어마이스터고등학교",
        "미림여자정보과학고"
    ]
    @Published var isNavigateSignup = false

    private let findIDUseCase: any FindIDUseCase

    public init(findIDUseCase: any FindIDUseCase) {
        self.findIDUseCase = findIDUseCase
    }

    func findIDButtonDidTap() {
    }
}
