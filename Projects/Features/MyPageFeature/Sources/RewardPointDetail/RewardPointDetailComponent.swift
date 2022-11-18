import DomainModule
import NeedleFoundation
import SwiftUI

public protocol RewardPointDetailDependency: Dependency {
    var fetchPointsUseCase: any FetchPointsUseCase { get }
    var rewardPointDetailComponent: RewardPointDetailComponent { get }
}

public final class RewardPointDetailComponent: Component<RewardPointDetailDependency> {
    public func makeView() -> some View {
        RewardPointDetailView(
            viewModel: .init(
                fetchPointsUseCase: self.dependency.fetchPointsUseCase
            ),
            rewardPointDetailComponent: dependency.rewardPointDetailComponent
        )
    }
}
