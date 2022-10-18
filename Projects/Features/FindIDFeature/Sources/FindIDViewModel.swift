import BaseFeature
import Combine
import DomainModule

final class FIndIDViewModel: BaseViewModel {

    @Published var schoolID = ""
    @Published var name = ""
    @Published var grade = 0
    @Published var classRoom = 0
    @Published var number = 0

    @Published var isNavigateSignup = false

    private let findIDUseCase: any FindIDUseCase

    public init(findIDUseCase: any FindIDUseCase) {
        self.findIDUseCase = findIDUseCase
    }

    func findIDButtonDidTap() {
    }
}
