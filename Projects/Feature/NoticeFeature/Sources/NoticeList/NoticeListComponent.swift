import NoticeDomainInterface
import NeedleFoundation
import SwiftUI
import NoticeFeatureInterface

public protocol NoticeListDependency: Dependency {
    var fetchNoticeListUseCase: any FetchNoticeListUseCase { get }
    var noticeDetailFactory: any NoticeDetailFactory { get }
}

public final class NoticeListComponent: Component<NoticeListDependency>, NoticeListFactory {
    public func makeView() -> some View {
        NoticeListView(
            viewModel: .init(
                fetchNoticeListUseCase: dependency.fetchNoticeListUseCase
            ),
            noticeDetailFactory: dependency.noticeDetailFactory
        )
    }
}
