import NeedleFoundation
import SwiftUI
import KeychainModule

final class WidgetComponent: BootstrapComponent {
    var keychain: any Keychain {
        shared {
            KeychainImpl()
        }
    }

    @WidgetBundleBuilder
    func makeWidget() -> some Widget {
        dmsMealComponent.makeWidget()
        dmsNoticeComponent.makeWidget()
        dmsPointComponent.makeWidget()
    }
}

// MARK: - Components
extension WidgetComponent {
    var dmsMealComponent: DMSMealComponent {
        DMSMealComponent(parent: self)
    }

    var dmsNoticeComponent: DMSNoticeComponent {
        DMSNoticeComponent(parent: self)
    }

    var dmsPointComponent: DMSPointComponent {
        DMSPointComponent(parent: self)
    }
}
