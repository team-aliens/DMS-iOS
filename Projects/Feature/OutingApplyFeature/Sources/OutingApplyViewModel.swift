import OutingDomainInterface
import BaseFeature
import SwiftUI

final class OutingApplyViewModel: BaseViewModel {
    @Published var isShowingErrorToast = false
    @Published var isShowingToast = false
    @Published var toastMessage = ""

    @Published var isApplied = false
    @Published var isShowingBottomSheet: Bool = false

    var rangeString: String {
        "외출 신청 시간은 금 18:00 ~ 금 21:00 까지 입니다."
    }

    private let fetchMyOutingApplicationItemUseCase: any FetchMyOutingApplicationItemUseCase

    public init(
        fetchMyOutingApplicationItemUseCase: any FetchMyOutingApplicationItemUseCase
    ) {
        self.fetchMyOutingApplicationItemUseCase = fetchMyOutingApplicationItemUseCase
    }
}