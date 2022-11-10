import DomainModule
import NeedleFoundation
import SwiftUI

public protocol RewardPointDetailDependency: Dependency {
    var fetchDetailNoticeUseCase: any FetchDetailNoticeUseCase { get }
}

public final class RewardPointDetailComponent: Component<RewardPointDetailDependency> {
    public func makeView(id: String) -> some View {
        RewardPointDetailView(
            viewModel: .init(
                fetchDetailNoticeUseCase: self.dependency.fetchDetailNoticeUseCase,
                id: id
            )
        )
    }
}
