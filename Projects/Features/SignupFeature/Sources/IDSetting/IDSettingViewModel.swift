import BaseFeature
import Combine
import DesignSystem
import DomainModule
import Utility

final class IDSettingViewModel: BaseViewModel {
    @Published var grade = "" {
        didSet { isCheckedStudent = false }
    }
    @Published var group = "" {
        didSet { isCheckedStudent = false }
    }
    @Published var number = "" {
        didSet { isCheckedStudent = false }
    }
    @Published var id = "" {
        didSet { resettingError() }
    }
    @Published var isShowingCheckStudent = false
    @Published var checkedName = ""
    @Published var isInvalidIDError = false
    @Published var isCheckedStudent = false
    @Published var isShowingToast = false
    @Published var toastMessage = ""
    @Published var toastStyle: DmsToastStyle = .info
    @Published var isNavigateSignupPassword = false

    var isEnabledNextStep: Bool {
        (!isCheckedStudent && !grade.isEmpty && !group.isEmpty && !number.isEmpty)
        || (isCheckedStudent && !grade.isEmpty && !group.isEmpty && !number.isEmpty && !id.isEmpty)
    }

    private let checkAccountIDIsExistUseCase: any CheckAccountIDIsExistUseCase
    private let checkExistGradeClassNumberUseCase: any CheckExistGradeClassNumberUseCase
    let idSettingParam: IDSettingParam

    init(
        checkAccountIDIsExistUseCase: any CheckAccountIDIsExistUseCase,
        checkExistGradeClassNumberUseCase: any CheckExistGradeClassNumberUseCase,
        idSettingParam: IDSettingParam
    ) {
        self.checkAccountIDIsExistUseCase = checkAccountIDIsExistUseCase
        self.checkExistGradeClassNumberUseCase = checkExistGradeClassNumberUseCase
        self.idSettingParam = idSettingParam
    }

    func nameCheckButtonDidTap() {
        isCheckedStudent = true
        toastStyle = .success
        toastMessage = "확인되었습니다."
        isShowingToast = true
    }

    func nextButtonDidTap() {
        guard isCheckedStudent else {
            guard
                let grade = Int(grade),
                let `class` = Int(group),
                let number = Int(number)
            else { return }

            addCancellable(
                checkExistGradeClassNumberUseCase.execute(
                    req: .init(schoolID: idSettingParam.schoolID, grade: grade, class: `class`, number: number)
                )
            ) { [weak self] name in
                self?.checkedName = name
                self?.isShowingCheckStudent = true
            }
            return
        }

        guard isEnabledNextStep else {
            return
        }

        addCancellable(
            checkAccountIDIsExistUseCase.execute(id: id)
        ) { [weak self] _ in
            self?.isNavigateSignupPassword = true
        } onReceiveError: { [weak self] _ in
            self?.isInvalidIDError = true
        }
    }

    func resettingError() {
        isErrorOcuured = false
        isInvalidIDError = false
    }
}
