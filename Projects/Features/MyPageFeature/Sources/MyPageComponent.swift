import SwiftUI
import NeedleFoundation

public protocol MyPageDependency: Dependency {}

public final class MyPageComponent: Component<MyPageDependency> {
    public func makeView() -> some View {
        Text("Text")
    }
}
