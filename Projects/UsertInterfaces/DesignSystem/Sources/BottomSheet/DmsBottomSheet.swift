import SwiftUI

struct DmsBottomSheet<T: View>: ViewModifier {
    @Binding var isShowing: Bool
    var content: () -> T
    @State var dragHeight: CGFloat = 0

    init(
        isShowing: Binding<Bool>,
        content: @escaping () -> T
    ) {
        _isShowing = isShowing
        self.content = content
    }

    func body(content: Content) -> some View {
        ZStack {
            content

            ZStack(alignment: .bottom) {
                if isShowing {
                    Color.GrayScale.gray9
                        .opacity(0.10)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                isShowing = false
                            }
                        }
                        .gesture(
                            DragGesture(minimumDistance: 0, coordinateSpace: .global)
                                .onChanged { value in
                                    withAnimation {
                                        dragHeight = -value.translation.height
                                    }
                                }
                                .onEnded { value in
                                    withAnimation {
                                        dragHeight = 0
                                    }
                                    let verticalAmount = value.translation.height
                                    if verticalAmount > -100 {
                                        withAnimation {
                                            isShowing = false
                                        }
                                    }
                                }
                        )
                        .transition(.opacity)

                    ZStack {
                        Color.GrayScale.gray1
                            .cornerRadius(24, corners: [.topLeft, .topRight])
                            .padding(.top, -dragHeight)

                        self.content()
                            .offset(y: -dragHeight)
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 42)
                    }
                    .frame(maxHeight: .infinity)
                    .fixedSize(horizontal: false, vertical: true)
                    .transition(.move(edge: .bottom))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
}

public extension View {
    func bottomSheet<Content: View>(
        isShowing: Binding<Bool>,
        content: @escaping () -> Content
    ) -> some View {
        modifier(DmsBottomSheet(isShowing: isShowing, content: content))
    }
}

