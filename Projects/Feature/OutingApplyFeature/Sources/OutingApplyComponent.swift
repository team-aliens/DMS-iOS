import SwiftUI
import OutingDomainInterface
import NeedleFoundation
import OutingApplyFeatureInterface

public protocol OutingApplyDependency: Dependency {
    var fetchMyOutingApplicationItemUseCase: any FetchMyOutingApplicationItemUseCase { get }
}

public final class OutingApplyComponent: Component<OutingApplyDependency>, OutingApplyFactory {
    public func makeView() -> some View {
        OutingApplyView(
            viewModel: .init(
                fetchMyOutingApplicationItemUseCase: dependency.fetchMyOutingApplicationItemUseCase
            )
        )
    }
}
