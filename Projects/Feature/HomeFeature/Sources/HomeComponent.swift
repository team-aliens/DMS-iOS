import MealDomainInterface
import NoticeDomainInterface
import NeedleFoundation
import SwiftUI
import HomeFeatureInterface

public protocol HomeDependency: Dependency {
    var fetchMealListUseCase: any FetchMealListUseCase { get }
    var fetchWhetherNewNoticeUseCase: any FetchWhetherNewNoticeUseCase { get }
}

public final class HomeComponent: Component<HomeDependency>, HomeFactory {
    public func makeView() -> some View {
        NavigationView {
            HomeView(
                viewModel: .init(
                    fetchMealListUseCase: dependency.fetchMealListUseCase,
                    fetchWhetherNewNoticeUseCase: dependency.fetchWhetherNewNoticeUseCase
                )
            )
        }
        .navigationViewStyle(.stack)
    }
}
