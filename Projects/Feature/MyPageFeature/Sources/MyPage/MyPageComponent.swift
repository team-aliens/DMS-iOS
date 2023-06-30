import StudentsDomainInterface
import AuthDomainInterface
import SwiftUI
import NeedleFoundation
import MyPageFeatureInterface

public protocol MyPageDependency: Dependency {
    var fetchMyProfileUseCase: any FetchMyProfileUseCase { get }
    var logoutUseCase: any LogoutUseCase { get }
    var withdrawalUseCase: any WithdrawalUseCase { get }
    var changeProfileFactory: any ChangeProfileFactory { get }
    var rewardPointDetailFactory: any RewardPointDetailFactory { get }
    var checkPasswordFactory: any CheckPasswordFactory { get }
    var setNotificationFactory: any SetNotificationFactory { get }
}

public final class MyPageComponent: Component<MyPageDependency>, MyPageFactory {
    public func makeView() -> some View {
        NavigationView {
            MyPageView(
                viewModel: .init(
                    fetchMyProfileUseCase: self.dependency.fetchMyProfileUseCase,
                    logoutUseCase: self.dependency.logoutUseCase,
                    withdrawalUseCase: self.dependency.withdrawalUseCase
                ),
                changeProfileFactory: self.dependency.changeProfileFactory,
                rewardPointDetailFactory: self.dependency.rewardPointDetailFactory,
                checkPasswordFactory: self.dependency.checkPasswordFactory,
                setNotificationFactory: self.dependency.setNotificationFactory
            )
        }
        .navigationViewStyle(.stack)
    }
}
