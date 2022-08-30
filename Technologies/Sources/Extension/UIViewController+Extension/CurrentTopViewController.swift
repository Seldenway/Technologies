import UIKit

extension UIViewController {
    var currentTopViewController: UIViewController? {
        if let navigationController = self as? UINavigationController {
            return navigationController.topViewController?.currentTopViewController
        } else if let tabBarController = self as? UITabBarController {
            return tabBarController.selectedViewController?.currentTopViewController
        } else if let presentedViewController = presentedViewController {
            return presentedViewController.currentTopViewController
        } else {
            return self
        }
    }
}
