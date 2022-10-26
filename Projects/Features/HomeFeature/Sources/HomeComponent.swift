import DomainModule
import NeedleFoundation
import SwiftUI

public protocol HomeDependency: Dependency {
    var fetchMealListUseCase: any FetchMealListUseCase { get }
}

public final class HomeComponent: Component<HomeDependency> {
    public func makeView() -> some View {
        NavigationView {
            HomeView(
                viewModel: .init(
                    fetchMealListUseCase: dependency.fetchMealListUseCase
                )
            )
        }
    }
}
