import SwiftUI

struct DMSTimeBottomSheet<T: View>: ViewModifier {
    @Binding var isShowing: Bool
    @State var dragHeight: CGFloat = 0
    var content: () -> T
    var height: CGFloat
    var sheetDragging: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { value in
                withAnimation(.spring()) {
                    dragHeight = min(30, -value.translation.height)
                }
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    dragHeight = 0
                }
                let verticalAmount = value.translation.height
                if verticalAmount > 100 {
                    withAnimation {
                        isShowing = false
                    }
                }
            }
    }

    init(
        isShowing: Binding<Bool>,
        height: CGFloat = .infinity,
        content: @escaping () -> T
    ) {
        _isShowing = isShowing
        self.height = height
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
                        .gesture(sheetDragging)
                        .transition(.opacity)

                    ZStack {
                        Color.GrayScale.gray1
                        .cornerRadius(8, corners: [.topLeft, .topRight])
                            .padding(.top, -dragHeight)
                            .gesture(sheetDragging)

                        VStack {
                            self.content()
                                .frame(maxWidth: .infinity)
                        }
                        .padding(.bottom, 42)
                        .offset(y: -dragHeight)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .transition(.move(edge: .bottom))
                    .if(height != .infinity) {
                        $0.frame(height: height)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
}

public extension View {
    func dmsTimeBottomSheet<Content: View>(
        isShowing: Binding<Bool>,
        content: @escaping () -> Content
    ) -> some View {
        modifier(DMSTimeBottomSheet(isShowing: isShowing, content: content))
    }
}
