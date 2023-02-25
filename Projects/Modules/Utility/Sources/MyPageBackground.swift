import SwiftUI
import DesignSystem

public struct MyPageBackground: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.GrayScale.gray1)
                    .dmsShadow(style: .surface)
            }
    }
}

public extension View {
    func myPageBackground() -> some View {
        self
            .modifier(MyPageBackground())
    }
}
