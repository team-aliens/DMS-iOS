import BaseFeature
import Combine
import DomainModule

final class FIndIDViewModel: BaseViewModel {

    @Published var schoolID = ""
    @Published var name = ""
    @Published var grade = ""
    @Published var classRoom = ""
    @Published var number = ""

    @Published var schoolList: [String] =  []
    @Published var isNavigateSignup = false

    private let findIDUseCase: any FindIDUseCase
    private let checkSchoolCodeUseCase: any CheckSchoolCodeUseCase

    public init(
        findIDUseCase: any FindIDUseCase,
        checkSchoolCodeUseCase: any CheckSchoolCodeUseCase
    ) {
        self.findIDUseCase = findIDUseCase
        self.checkSchoolCodeUseCase = checkSchoolCodeUseCase
    }

    func findIDButtonDidTap() {
    }
}
