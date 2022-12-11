import BaseFeature
import Combine
import DomainModule

final class MyPageViewModel: BaseViewModel {
    @Published var profile: MyProfileEntity?
    @Published var isPresentedLogoutAlert = false
    @Published var isNavigateChangeProfile = false
    @Published var isNavigateChangePassword = false
    @Published var isNavigateRewardPointDetail = false

    private let fetchMyProfileUseCase: any FetchMyProfileUseCase

    public init(
        fetchMyProfileUseCase: any FetchMyProfileUseCase
    ) {
        self.fetchMyProfileUseCase = fetchMyProfileUseCase
    }

    func onAppear() {
        addCancellable(
            fetchMyProfileUseCase.execute()
        ) { [weak self] profile in
            self?.profile = profile
        }
    }

    func logoutButtonDidTap() {
        isPresentedLogoutAlert = true
    }

    func confirmLogoutButtonDidTap() {}

    func profileImageDidTap() {
        isNavigateChangeProfile = true
    }
}
