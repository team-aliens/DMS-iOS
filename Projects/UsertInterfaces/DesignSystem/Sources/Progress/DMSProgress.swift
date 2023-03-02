import SwiftUI

public extension View {
    func progress(
        isPresented: Binding<Bool>
    ) -> some View {
        modifier(DMSProgress(isPresented: isPresented))
    }
}
struct DMSProgress: ViewModifier {
    @Binding var isPresented: Bool

    func body(content: Content) -> some View {
        ZStack {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            if isPresented {
                Color.GrayScale.gray9.opacity(0.4)
                    .ignoresSafeArea()
                    .transition(.opacity)
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            }
        }
        .animation(.easeInOut, value: isPresented)
   }
}
