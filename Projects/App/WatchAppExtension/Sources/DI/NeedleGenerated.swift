

import DataModule
import DomainModule
import Foundation
import KeychainModule
import NeedleFoundation
import NetworkModule
import SwiftUI
import WidgetKit

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class DMSPointDependencyff176818a996115c0c0aProvider: DMSPointDependency {
    var fetchPointListUseCase: any FetchPointListUseCase {
        return widgetComponent.fetchPointListUseCase
    }
    private let widgetComponent: WidgetComponent
    init(widgetComponent: WidgetComponent) {
        self.widgetComponent = widgetComponent
    }
}
/// ^->WidgetComponent->DMSPointComponent
private func factory330becbd0c489e2a02704da471824a033c398cee(_ component: NeedleFoundation.Scope) -> AnyObject {
    return DMSPointDependencyff176818a996115c0c0aProvider(widgetComponent: parent1(component) as! WidgetComponent)
}
private class DMSNoticeDependency5ec5a495e74657f18148Provider: DMSNoticeDependency {
    var fetchNoticeListUseCase: any FetchNoticeListUseCase {
        return widgetComponent.fetchNoticeListUseCase
    }
    private let widgetComponent: WidgetComponent
    init(widgetComponent: WidgetComponent) {
        self.widgetComponent = widgetComponent
    }
}
/// ^->WidgetComponent->DMSNoticeComponent
private func factory46bd7c514c98f34ee9e64da471824a033c398cee(_ component: NeedleFoundation.Scope) -> AnyObject {
    return DMSNoticeDependency5ec5a495e74657f18148Provider(widgetComponent: parent1(component) as! WidgetComponent)
}
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
extension DMSPointComponent: Registration {
    public func registerItems() {
        keyPathToName[\DMSPointDependency.fetchPointListUseCase] = "fetchPointListUseCase-any FetchPointListUseCase"
    }
}
extension DMSNoticeComponent: Registration {
    public func registerItems() {
        keyPathToName[\DMSNoticeDependency.fetchNoticeListUseCase] = "fetchNoticeListUseCase-any FetchNoticeListUseCase"
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
    registerProviderFactory("^->WidgetComponent->DMSPointComponent", factory330becbd0c489e2a02704da471824a033c398cee)
    registerProviderFactory("^->WidgetComponent->DMSNoticeComponent", factory46bd7c514c98f34ee9e64da471824a033c398cee)
    registerProviderFactory("^->WidgetComponent->DMSMealComponent", factory13e7c61b417a59a148c64da471824a033c398cee)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
