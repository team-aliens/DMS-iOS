import NeedleFoundation
import SwiftUI
import KeychainModule

final class WidgetComponent: BootstrapComponent {
    var keychain: any Keychain {
        shared {
            KeychainImpl()
        }
    }

    func makeWidget() -> some Widget {
        dmsMealComponent.makeWidget()
    }
}

// MARK: - Components
extension WidgetComponent {
    var dmsMealComponent: DMSMealComponent {
        DMSMealComponent(parent: self)
    }
}
