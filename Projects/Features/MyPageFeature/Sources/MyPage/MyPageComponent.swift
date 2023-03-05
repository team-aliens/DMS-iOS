import DomainModule
import SwiftUI
import NeedleFoundation

public protocol MyPageDependency: Dependency {
    var fetchMyProfileUseCase: any FetchMyProfileUseCase { get }
    var logoutUseCase: any LogoutUseCase { get }
    var withdrawalUseCase: any WithdrawalUseCase { get }
    var changeProfileComponent: ChangeProfileComponent { get }
    var rewardPointDetailComponent: RewardPointDetailComponent { get }
    var checkPasswordComponent: CheckPasswordComponent { get }
}

public final class MyPageComponent: Component<MyPageDependency> {
    public func makeView() -> some View {
        NavigationView {
            MyPageView(
                viewModel: .init(
                    fetchMyProfileUseCase: self.dependency.fetchMyProfileUseCase,
                    logoutUseCase: self.dependency.logoutUseCase,
                    withdrawalUseCase: self.dependency.withdrawalUseCase
                ),
                changeProfileComponent: self.dependency.changeProfileComponent,
                rewardPointDetailComponent: self.dependency.rewardPointDetailComponent,
                checkPasswordComponent: self.dependency.checkPasswordComponent
            )
        }
        .navigationViewStyle(.stack)
    }
}
