import DomainModule
import NeedleFoundation
import SwiftUI

protocol DMSPointDependency: Dependency {
    var fetchPointListUseCase: any FetchPointListUseCase { get }
}

final class DMSPointComponent: Component<DMSPointDependency> {
    func makeWidget() -> some Widget {
        DMSPointWidget(
            provider: .init(
                fetchPointListUseCase: dependency.fetchPointListUseCase
            )
        )
    }
}
