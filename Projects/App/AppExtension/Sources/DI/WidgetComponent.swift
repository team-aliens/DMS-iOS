import NeedleFoundation
import SwiftUI

final class WidgetComponent: BootstrapComponent {
    var dmsMealComponent: DMSMealComponent {
        DMSMealComponent(parent: self)
    }

    func makeWidget() -> some Widget {
        dmsMealComponent.makeWidget()
    }
}
