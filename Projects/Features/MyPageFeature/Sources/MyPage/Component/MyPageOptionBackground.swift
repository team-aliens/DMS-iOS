import SwiftUI
import DesignSystem

public struct MyPageOptionBackground: ViewModifier {
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
    func myPageOptionBackground() -> some View {
        self
            .modifier(MyPageOptionBackground())
    }
}
