

import NeedleFoundation
import SigninFeature
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class SigninDependencyde06a9d0b22764487733Provider: SigninDependency {


    init() {

    }
}
/// ^->AppComponent->SigninComponent
private func factory2882a056d84a613debcce3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SigninDependencyde06a9d0b22764487733Provider()
}

#else
extension AppComponent: Registration {
    public func registerItems() {

        localTable["signinComponent-SigninComponent"] = { self.signinComponent as Any }
    }
}
extension SigninComponent: Registration {
    public func registerItems() {

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

private func register1() {
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->SigninComponent", factory2882a056d84a613debcce3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
