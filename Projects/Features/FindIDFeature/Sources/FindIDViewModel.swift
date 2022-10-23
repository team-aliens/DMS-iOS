import BaseFeature
import Combine
import DomainModule

final class FIndIDViewModel: BaseViewModel {

    @Published var schoolID = ""
    @Published var name = ""
    @Published var grade = ""
    @Published var classRoom = ""
    @Published var number = ""

    @Published var schoolList: [SchoolEntity] =  []
    @Published var isNavigateSignup = false
    @Published var isSuccessFindID = false

    var isSigninButtonEnabled: Bool {
        !schoolID.isEmpty && !name.isEmpty && !grade.isEmpty && !classRoom.isEmpty && !number.isEmpty
     }

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
        guard isSigninButtonEnabled else { return }
        guard let grade = Int(grade) else { return }
        guard let classRoom = Int(classRoom) else { return }
        guard let number = Int(number) else { return }

        addCancellable(findIDUseCase.execute(req: .init(
            schoolID: schoolID,
            name: name,
            grade: grade,
            classRoom: classRoom,
            number: number))) { [weak self] _ in
                self?.isSuccessFindID = true
         }
    }
}
