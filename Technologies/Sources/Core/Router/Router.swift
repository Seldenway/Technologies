import UIKit

class Router: NSObject, RouterType {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    func push(_ presentable: Presentable, animated: Bool) {
        guard let viewController = presentable.viewController else { return }
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func pop(_ animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func popToRoot(_ animated: Bool) {
        navigationController.popToRootViewController(animated: animated)
    }
    
    func present(_ presentable: Presentable, animated: Bool, options: PresentationOptions?) {
        guard let viewController = presentable.viewController else { return }
        if let options = options {
            viewController.modalTransitionStyle = options.transitionStyle
            viewController.modalPresentationStyle = options.modalPresentationStyle
        }
        
        navigationController.currentTopViewController?.present(viewController, animated: true)
    }
    
    func dismiss(animated: Bool) {
        navigationController.dismiss(animated: animated)
    }
    
    func show(_ presentable: Presentable, animated: Bool) {
        guard let viewController = presentable.viewController else { return }
        navigationController.setViewControllers([viewController], animated: animated)
    }
}
