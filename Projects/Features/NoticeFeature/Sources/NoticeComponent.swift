import DomainModule
import NeedleFoundation
import SwiftUI

public protocol NoticeDependency: Dependency {
    var fetchNoticeListUseCase: any FetchNoticeListUseCase { get }
}

public final class NoticeComponent: Component<NoticeDependency> {
    public func makeView() -> some View {
        NoticeView(
            viewModel: .init(
                fetchNoticeListUseCase: dependency.fetchNoticeListUseCase
            )
        )
    }
}
