import UIKit

final class LanguageCoordinator: RoutingCoordinator {
    override func start() {
        let viewController = prepare()
        router.push(viewController, animated: true)
    }
    
    private func prepare() -> UIViewController {
        let viewModel = LanguageViewModel()
        let viewController = LanguageViewController(viewModel: viewModel)
        self.viewController = viewController
        return viewController
    }
}
