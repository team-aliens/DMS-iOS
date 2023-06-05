import BaseFeature
import Combine
import SchoolDomainInterface
import StudentsDomainInterface

final class FIndIDViewModel: BaseViewModel {
    @Published var schoolID = ""
    @Published var name = ""
    @Published var grade = ""
    @Published var classRoom = ""
    @Published var number = ""
    @Published var email = ""

    @Published var schoolList: [SchoolEntity] =  []
    @Published var isNavigateSignup = false
    @Published var isSuccessFindID = false
    @Published var isShowingToast = false
    @Published var toastMessage = ""

    var isFindEnabled: Bool {
        !schoolID.isEmpty && !name.isEmpty && !grade.isEmpty && !classRoom.isEmpty && !number.isEmpty
     }

    private let findIDUseCase: any FindIDUseCase
    private let fetchSchoolListUseCase: any FetchSchoolListUseCase

    public init(
        findIDUseCase: any FindIDUseCase,
        fetchSchoolListUseCase: any FetchSchoolListUseCase
    ) {
        self.findIDUseCase = findIDUseCase
        self.fetchSchoolListUseCase = fetchSchoolListUseCase
    }

    func onAppear() {
        addCancellable(fetchSchoolListUseCase.execute()) { [weak self] schoolList in
            self?.schoolList = schoolList
        }
    }
    func findIDButtonDidTap() {
        guard isFindEnabled else { return }
        guard let grade = Int(grade) else { return }
        guard let classRoom = Int(classRoom) else { return }
        guard let number = Int(number) else { return }

        addCancellable(
            findIDUseCase.execute(
                req: .init(
                    schoolID: schoolID,
                    name: name,
                    grade: grade,
                    classRoom: classRoom,
                    number: number
                )
            )
        ) { [weak self] email in
            self?.email = email
            self?.isSuccessFindID = true
        }
    }
}
