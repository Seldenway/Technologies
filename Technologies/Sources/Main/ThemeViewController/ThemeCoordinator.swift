import UIKit

final class ThemeCoordinator: RoutingCoordinator {
    override func start() {
        let viewController = prepare()
        router.push(viewController, animated: true)
    }
    
    private func prepare() -> UIViewController {
        let viewModel = ThemeViewModel()
        let viewController = ThemeViewController(viewModel: viewModel)
        self.viewController = viewController
        return viewController
    }
}
