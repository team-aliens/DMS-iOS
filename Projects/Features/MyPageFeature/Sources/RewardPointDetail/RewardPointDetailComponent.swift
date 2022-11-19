import DomainModule
import NeedleFoundation
import SwiftUI

public protocol RewardPointDetailDependency: Dependency {
    var fetchPointListUseCase: any FetchPointListUseCase { get }
    var rewardPointDetailComponent: RewardPointDetailComponent { get }
}

public final class RewardPointDetailComponent: Component<RewardPointDetailDependency> {
    public func makeView() -> some View {
        RewardPointDetailView(
            viewModel: .init(
                fetchPointListUseCase: self.dependency.fetchPointListUseCase
            ),
            rewardPointDetailComponent: dependency.rewardPointDetailComponent
        )
    }
}
