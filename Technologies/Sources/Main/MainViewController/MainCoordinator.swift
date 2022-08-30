import UIKit

final class MainRouter: Router {}

final class MainCoordinator: RoutingCoordinator {
    override func start() {
        let viewModel = MainViewModel()
        viewModel.delegate = self
        let viewController = MainViewController(viewModel: viewModel)
        router.push(viewController, animated: true)
    }
}

extension MainCoordinator: MainViewModelDelegate {}
