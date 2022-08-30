import Foundation

protocol ThemeViewModelDelegate {
    func showThemeController()
}

extension ThemeViewModelDelegate where Self: RoutingCoordinator {
    func showThemeController() {
        let cooordinator = ThemeCoordinator(router: router, assembler: assembler)
        store(coordinator: cooordinator)
        cooordinator.start()
    }
}
