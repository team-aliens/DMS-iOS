import NoticeDomainInterface
import NeedleFoundation
import SwiftUI
import NoticeFeatureInterface

public protocol NoticeDetailDependency: Dependency {
    var fetchDetailNoticeUseCase: any FetchDetailNoticeUseCase { get }
}

public final class NoticeDetailComponent: Component<NoticeDetailDependency>, NoticeDetailFactory {
    public func makeView(id: String) -> some View {
        NoticeDetailView(
            viewModel: .init(
                fetchDetailNoticeUseCase: self.dependency.fetchDetailNoticeUseCase,
                id: id
            )
        )
    }
}
