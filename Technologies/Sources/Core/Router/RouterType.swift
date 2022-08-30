import Combine
import UIKit

typealias NavigationBackClosure = (() -> ())

typealias RouterType = NavigationRouter & PresentationRouter

protocol NavigationRouter: AnyObject {
    func push(_ presentable: Presentable, animated: Bool)
    func pop(_ animated: Bool)
    func popToRoot(_ animated: Bool)
}

protocol PresentationRouter: AnyObject {
    func present(_ presentable: Presentable, animated: Bool, options: PresentationOptions?)
    func dismiss(animated: Bool)
    func show(_ presentable: Presentable, animated: Bool)
}

struct PresentationOptions {
    let modalPresentationStyle: UIModalPresentationStyle
    let transitionStyle: UIModalTransitionStyle
    
    static var `default` = PresentationOptions(modalPresentationStyle: .automatic, transitionStyle: .coverVertical)
}
