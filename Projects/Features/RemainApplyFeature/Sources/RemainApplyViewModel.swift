import BaseFeature
import Combine

final class RemainApplyViewModel: BaseViewModel {
    @Published var selectedNum: Int = 10
    @Published var selectedType: String = ""
    @Published var isAlreadyApplied: Bool = false
    @Published var appliedState: String = ""
    @Published var appliedStateNum: Int = 10
    @Published var isDetailTapped: Bool = false

    @Published var isApplicationTime = true
    @Published var isShowingToast = false
    @Published var toastMessage = "잔류 신청 시간이 아닙니다."

    var startTime = "화 18:00"
    var endTime = "목 18:00"
    var rangeString: String {
        let text = "잔류 신청 시간은 " + startTime +
        " ~ " + endTime + " 까지 입니다."
        return text
    }
}
