import Foundation
import NeedleFoundation
import SwiftUI

protocol DMSMealDependency: Dependency {
    
}

final class DMSMealComponent: Component<DMSMealDependency> {
    func makeWidget() -> some Widget {
        DMSMealWidget(
            provider: .init()
        )
    }
}
