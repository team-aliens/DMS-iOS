import DomainModule
import NeedleFoundation
import SwiftUI

public protocol RewardPointDetailDependency: Dependency {
    var fetchMyProfileUseCase: any FetchMyProfileUseCase { get }
    var rewardPointDetailComponent: RewardPointDetailComponent { get }
}

public final class RewardPointDetailComponent: Component<RewardPointDetailDependency> {
    public func makeView() -> some View {
        RewardPointDetailView(
            viewModel: .init(
                fetchMyProfileUseCase: self.dependency.fetchMyProfileUseCase
            ),
            rewardPointDetailComponent: dependency.rewardPointDetailComponent
        )
    }
}
