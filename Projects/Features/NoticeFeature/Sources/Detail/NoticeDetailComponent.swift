import DomainModule
import NeedleFoundation
import SwiftUI

public protocol NoticeDetailDependency: Dependency {
    var fetchDetailNoticeUseCase: any FetchDetailNoticeUseCase { get }
}

public final class NoticeDetailComponent: Component<NoticeDetailDependency> {
    public func makeView(id: String) -> some View {
        NoticeDetailView(
            viewModel: .init(
                fetchDetailNoticeUseCase: self.dependency.fetchDetailNoticeUseCase,
                id: id
            )
        )
    }
}
