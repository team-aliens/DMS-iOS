import UIKit

public struct NavigationUtil {
    public static func popToRootView() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        findNavigationController(
            viewController: windowScene?.windows.filter { $0.isKeyWindow }.first?.rootViewController
        )?.popToRootViewController(animated: true)
    }
static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }
if let navigationController = viewController as? UINavigationController {
            return navigationController
        }
for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }
return nil
    }
}
