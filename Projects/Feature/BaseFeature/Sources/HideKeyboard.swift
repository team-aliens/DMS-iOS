import SwiftUI
import UIKit

public extension View {
    func hideKeyboardWhenTap() -> some View {
        onAppear(perform: UIApplication.shared.hideKeyboard)
    }
}

public extension UIApplication {
    func hideKeyboard() {
        guard
            let scene = connectedScenes.first as? UIWindowScene,
            let window = scene.windows.first
        else { return }
        let tapRecognizer = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapRecognizer.cancelsTouchesInView = false
        tapRecognizer.delegate = self
        window.addGestureRecognizer(tapRecognizer)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
    ) -> Bool {
        return false
    }
}
