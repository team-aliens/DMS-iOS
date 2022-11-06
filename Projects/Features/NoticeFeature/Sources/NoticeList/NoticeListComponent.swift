import DomainModule
import NeedleFoundation
import SwiftUI

public protocol NoticeDependency: Dependency {
    var fetchNoticeListUseCase: any FetchNoticeListUseCase { get }
}

public final class NoticeListComponent: Component<NoticeDependency> {
    public func makeView() -> some View {
        NoticeListView(
            viewModel: .init(
                fetchNoticeListUseCase: dependency.fetchNoticeListUseCase
            )
        )
    }
}
