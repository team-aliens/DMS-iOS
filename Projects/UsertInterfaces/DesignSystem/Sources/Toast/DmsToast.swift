import SwiftUI

struct DmsToast: ViewModifier {
    @Binding var isShowing: Bool
    let message: String
    let style: DmsToastStyle

    init(
        isShowing: Binding<Bool>,
        message: String,
        style: DmsToastStyle
    ) {
        _isShowing = isShowing
        self.message = message
        self.style = style
    }

    func body(content: Content) -> some View {
        ZStack {
            content

            dmsToastView()
        }
        .onChange(of: isShowing) { _ in
            if isShowing {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isShowing = false
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func dmsToastView() -> some View {
        VStack {
            if isShowing {
                HStack(spacing: 10) {
                    style.icon
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: style.size.width, height: style.size.height)
                        .foregroundColor(style.iconForeground)

                    Text(message)
                        .dmsFont(.body(.body3), color: style.textForeground)

                    Spacer()
                }
                .transition(.offset(y: -50).combined(with: AnyTransition.opacity.animation(.default)))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .padding(.horizontal, 16)
                .background {
                    Rectangle()
                        .fill(Color.GrayScale.gray1)
                        .cornerRadius(4)
                        .shadow(
                            color: .GrayScale.gray9.opacity(0.08),
                            y: 1,
                            blur: 16
                        )
                }
                .padding(.horizontal, 12)
                .onTapGesture {
                    withAnimation {
                        isShowing = false
                    }
                }
            }

            Spacer()
        }
        .animation(.default, value: isShowing)
    }
}

public extension View {
    func dmsToast(
        isShowing: Binding<Bool>,
        message: String,
        style: DmsToastStyle
    ) -> some View {
        modifier(DmsToast(isShowing: isShowing, message: message, style: style))
    }
}
