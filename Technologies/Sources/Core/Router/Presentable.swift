import UIKit

protocol Presentable {
    var viewController: UIViewController? { get }
}

extension UIViewController: Presentable {
    var viewController: UIViewController? { return self }
}
