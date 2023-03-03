

import DataModule
import DomainModule
import Foundation
import KeychainModule
import NeedleFoundation
import NetworkModule
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class DMSMealDependency70d41dc5104d5ffc5b95Provider: DMSMealDependency {
    var fetchMealListUseCase: any FetchMealListUseCase {
        return widgetComponent.fetchMealListUseCase
    }
    private let widgetComponent: WidgetComponent
    init(widgetComponent: WidgetComponent) {
        self.widgetComponent = widgetComponent
    }
}
/// ^->WidgetComponent->DMSMealComponent
private func factory13e7c61b417a59a148c64da471824a033c398cee(_ component: NeedleFoundation.Scope) -> AnyObject {
    return DMSMealDependency70d41dc5104d5ffc5b95Provider(widgetComponent: parent1(component) as! WidgetComponent)
}

#else
extension WidgetComponent: Registration {
    public func registerItems() {


    }
}
extension DMSMealComponent: Registration {
    public func registerItems() {
        keyPathToName[\DMSMealDependency.fetchMealListUseCase] = "fetchMealListUseCase-any FetchMealListUseCase"
    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->WidgetComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->WidgetComponent->DMSMealComponent", factory13e7c61b417a59a148c64da471824a033c398cee)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
