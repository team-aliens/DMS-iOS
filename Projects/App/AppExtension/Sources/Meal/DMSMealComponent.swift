import NeedleFoundation
import SwiftUI
import MealDomainInterface

protocol DMSMealDependency: Dependency {
    var fetchMealListUseCase: any FetchMealListUseCase { get }
}

final class DMSMealComponent: Component<DMSMealDependency> {
    func makeWidget() -> some Widget {
        DMSMealWidget(
            provider: .init(
                fetchMealListUseCase: dependency.fetchMealListUseCase
            )
        )
    }
}
