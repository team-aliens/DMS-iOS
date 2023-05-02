import SwiftUI
import DomainModule
import NeedleFoundation

public protocol RemainApplyDependency: Dependency {
    var fetchMyRemainApplicationItemsUseCase: any FetchMyRemainApplicationItemsUseCase { get }
    var fetchRemainApplicationListUseCase: any FetchRemainApplicationListUseCase { get }
    var fetchRemainsAvailableTimeUseCase: any FetchRemainsAvailableTimeUseCase { get }
    var remainingApplicationsChangesUseCase: any RemainingApplicationsChangesUseCase { get }
}

public final class RemainApplyComponent: Component<RemainApplyDependency> {
    public func makeView() -> some View {
        RemainApplyView(
            viewModel: .init(
                fetchMyRemainApplicationItemsUseCase: dependency.fetchMyRemainApplicationItemsUseCase,
                fetchRemainApplicationListUseCase: dependency.fetchRemainApplicationListUseCase,
                fetchRemainsAvailableTimeUseCase: dependency.fetchRemainsAvailableTimeUseCase,
                remainingApplicationsChangesUseCase: dependency.remainingApplicationsChangesUseCase
            )
        )
    }
}
