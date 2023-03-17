import SwiftUI

struct DMSBottomSheet<T: View>: ViewModifier {
    @Binding var isShowing: Bool
    @State var isGrabberOn: Bool
    @State var sheetCornerRadiusValue: CGFloat
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
        isGrabberOn: Bool = false,
        sheetCornerRadiusValue: CGFloat = 25,
        height: CGFloat = .infinity,
        content: @escaping () -> T
    ) {
        _isShowing = isShowing
        self.isGrabberOn = isGrabberOn
        self.sheetCornerRadiusValue = sheetCornerRadiusValue
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
                            .cornerRadius(sheetCornerRadiusValue, corners: [.topLeft, .topRight])
                            .padding(.top, -dragHeight)
                            .gesture(sheetDragging)

                        VStack {
                            if isGrabberOn {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.GrayScale.gray4)
                                    .frame(width: 100, height: 4)
                                    .padding(.top, 12)
                            }

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
    func dmsBottomSheet<Content: View>(
        isShowing: Binding<Bool>,
        isGrabberOn: Bool = false,
        sheetCornerRadiusValue: CGFloat = 25,
        content: @escaping () -> Content
    ) -> some View {
        modifier(DMSBottomSheet(
            isShowing: isShowing,
            isGrabberOn: isGrabberOn,
            sheetCornerRadiusValue: sheetCornerRadiusValue,
            content: content
        ))
    }
}
