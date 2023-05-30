import NoticeDomainInterface
import NeedleFoundation
import SwiftUI
import NoticeFeatureInterface

public protocol NoticeListDependency: Dependency {
    var fetchNoticeListUseCase: any FetchNoticeListUseCase { get }
    var noticeDetailComponent: NoticeDetailComponent { get }
}

public final class NoticeListComponent: Component<NoticeListDependency>, NoticeListFactory {
    public func makeView() -> some View {
        NoticeListView(
            viewModel: .init(
                fetchNoticeListUseCase: dependency.fetchNoticeListUseCase
            ),
            noticeDetailComponent: dependency.noticeDetailComponent
        )
    }
}
