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

    public init(findIDUseCase: any FindIDUseCase) {
        self.findIDUseCase = findIDUseCase
    }

    func findIDButtonDidTap() {
    }
}
