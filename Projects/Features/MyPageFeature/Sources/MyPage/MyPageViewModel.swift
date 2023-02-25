import BaseFeature
import Combine
import DomainModule

final class MyPageViewModel: BaseViewModel {
    @Published var profile: MyProfileEntity?
    @Published var isPresentedLogoutAlert = false
    @Published var isNavigateChangeProfile = false
    @Published var isNavigateChangePassword = false
    @Published var isNavigateRewardPointDetail = false
    @Published var isPresentedWithdrawalAlert = false
    @Published var isSuccessLogout = false

    private let fetchMyProfileUseCase: any FetchMyProfileUseCase
    private let logoutUseCase: any LogoutUseCase
    private let withdrawalUseCase: any WithdrawalUseCase

    public init(
        fetchMyProfileUseCase: any FetchMyProfileUseCase,
        logoutUseCase: any LogoutUseCase,
        withdrawalUseCase: any WithdrawalUseCase
    ) {
        self.fetchMyProfileUseCase = fetchMyProfileUseCase
        self.logoutUseCase = logoutUseCase
        self.withdrawalUseCase = withdrawalUseCase
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

    func confirmLogoutButtonDidTap() {
        logoutUseCase.execute()
        isSuccessLogout = true
    }

    func profileImageDidTap() {
        isNavigateChangeProfile = true
    }

    func withdrawalButtonDidTap() {
        isPresentedWithdrawalAlert = true
    }

    func confirmWithdrawalButtonDidTap() {
        addCancellable(withdrawalUseCase.execute()) { [weak self] _ in
            self?.isSuccessLogout = true
        }
    }
}
