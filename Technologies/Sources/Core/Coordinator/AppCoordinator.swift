import UIKit
import Swinject

final class AppCoordinator: ContainerCoordinator {
    let window: UIWindow

    init(window: UIWindow, assembler: Assembler) {
        self.window = window
        super.init(assembler: assembler)
    }
    
    override func start() {
        let navigationController = UINavigationController()
        let mainRouter = MainRouter(navigationController: navigationController)
        let coordinator = MainCoordinator(router: mainRouter, assembler: assembler)
        store(coordinator: coordinator)
        coordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
