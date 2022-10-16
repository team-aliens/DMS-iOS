import NeedleFoundation
import SwiftUI

public protocol SigninDependency: Dependency {}

public final class SigninComponent: Component<SigninDependency> {
    public func makeView() -> some View {
        Text("Signin")
    }
}
