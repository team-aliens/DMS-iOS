import DomainModule
import NeedleFoundation
import SwiftUI

public protocol RewardPointDetailDependency: Dependency {
}

public final class RewardPointDetailComponent: Component<RewardPointDetailDependency> {
    public func makeView(id: String) -> some View {
        RewardPointDetailView(
            viewModel: .init(
            )
        )
    }
}
