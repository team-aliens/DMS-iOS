import DomainModule
import SwiftUI
import NeedleFoundation

public protocol MyPageDependency: Dependency {
    var fetchMyProfileUseCase: any FetchMyProfileUseCase { get }
}

public final class MyPageComponent: Component<MyPageDependency> {
    public func makeView() -> some View {
        NavigationView {
            MyPageView(
                viewModel: .init(
                    fetchMyProfileUseCase: self.dependency.fetchMyProfileUseCase
                )
            )
        }
    }
}
