import SwiftUI

struct DmsBottomSheet<T: View>: ViewModifier {
    @Binding var isShowing: Bool
    @State var dragHeight: CGFloat = 0
    var content: () -> T
    var sheetDragging: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { value in
                withAnimation(.spring()) {
                    dragHeight = min(30, -value.translation.height)
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
    }

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
                            withAnimation(.spring()) {
                                isShowing = false
                            }
                        }
                        .gesture(sheetDragging)
                        .transition(.opacity)

                    ZStack {
                        Color.GrayScale.gray1
                            .cornerRadius(25, corners: [.topLeft, .topRight])
                            .padding(.top, -dragHeight)
                            .gesture(sheetDragging)

                        VStack {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.GrayScale.gray4)
                                .frame(width: 100, height: 4)
                                .padding(.top, 12)

                            self.content()
                                .frame(maxWidth: .infinity)
                        }
                        .padding(.bottom, 42)
                        .offset(y: -dragHeight)
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
    func dmsBottomSheet<Content: View>(
        isShowing: Binding<Bool>,
        content: @escaping () -> Content
    ) -> some View {
        modifier(DmsBottomSheet(isShowing: isShowing, content: content))
    }
}
