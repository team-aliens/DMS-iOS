import DomainModule
import NeedleFoundation
import SwiftUI

protocol DMSNoticeDependency: Dependency {
    var fetchNoticeListUseCase: any FetchNoticeListUseCase { get }
}

final class DMSNoticeComponent: Component<DMSNoticeDependency> {
    func makeWidget() -> some Widget {
        DMSNoticeWidget(
            provider: .init(
                fetchNoticeListUseCase: dependency.fetchNoticeListUseCase
            )
        )
    }
}
