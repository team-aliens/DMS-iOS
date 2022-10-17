import SwiftUI

struct DmsBackButtonModifier: ViewModifier {
    let willDismiss: () -> Void
    let dismiss: DismissAction

    public init(
        willDismiss: @escaping () -> Void,
        dismiss: DismissAction
    ) {
        self.willDismiss = willDismiss
        self.dismiss = dismiss
    }

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        willDismiss()
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 9, height: 16)
                            .foregroundColor(.GrayScale.gray9)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
    }
}
public extension View {
    func dmsBackButton(
        willDismiss: @escaping () -> Void = {},
        dismiss: DismissAction
    ) -> some View {
        modifier(DmsBackButtonModifier(willDismiss: willDismiss, dismiss: dismiss))
    }
}

// SwipeGesture로 뒤로갈 수 있게 하는 extension
extension UINavigationController: ObservableObject, UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
