import DomainModule
import Foundation
import NeedleFoundation
import SwiftUI

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
