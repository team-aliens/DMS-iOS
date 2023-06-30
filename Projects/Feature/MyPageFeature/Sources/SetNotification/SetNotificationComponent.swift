import SwiftUI
import NeedleFoundation
import NotificationDomainInterface

public protocol SetNotificationDependency: Dependency {
    
}

public final class SetNotificationComponent: Component<SetNotificationDependency>, SetNotificationFactory {
    public func makeView() -> some View {
        SetNotificationView(viewModel: .init())
    }
}
