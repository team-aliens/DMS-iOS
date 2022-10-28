import BaseFeature
import Combine
import Utility

final class IDSettingViewModel: BaseViewModel {
    @Published var grade = ""
    @Published var group = ""
    @Published var number = ""

    @Published var id = "" {
        didSet { resettingError() }
    }
    @Published var isInvalidIDError = false

    var isEnabledNextStep: Bool {
        !grade.isEmpty && !group.isEmpty && !number.isEmpty && !id.isEmpty
    }

    func nextButtonDidTap() {
        guard isEnabledNextStep else {
            return
        }
    }

    func resettingError() {
        isErrorOcuured = false
        isInvalidIDError = false
    }
}
