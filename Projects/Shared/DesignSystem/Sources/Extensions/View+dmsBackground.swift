import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background {
                Color.System.background
                    .ignoresSafeArea()
            }
    }
}

public extension View {
    func dmsBackground() -> some View {
        modifier(BackgroundModifier())
    }
}
