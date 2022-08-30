import Foundation
import UIKit

final class LocalizationCoordinator: RoutingCoordinator {
    override func start() {
        let viewController = prepare()
        router.push(viewController, animated: true)
    }
    
    private func prepare() -> UIViewController {
        let viewModel = LocalizationViewModel()
        let viewController = LocalizationViewController(viewModel: viewModel)
        self.viewController = viewController
        return viewController
    }
}
