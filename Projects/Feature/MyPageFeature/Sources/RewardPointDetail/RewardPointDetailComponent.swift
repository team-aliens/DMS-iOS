import PointsDomainInterface
import NeedleFoundation
import SwiftUI
import MyPageFeatureInterface

public protocol RewardPointDetailDependency: Dependency {
    var fetchPointListUseCase: any FetchPointListUseCase { get }
}

public final class RewardPointDetailComponent: Component<RewardPointDetailDependency>, RewardPointDetailFactory {
    public func makeView() -> some View {
        RewardPointDetailView(
            viewModel: .init(
                fetchPointListUseCase: self.dependency.fetchPointListUseCase
            )
        )
    }
}
