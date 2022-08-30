import Foundation

protocol LocalizationViewModelDelegate {
    func showLocalizationController()
}

extension LocalizationViewModelDelegate where Self: RoutingCoordinator {
    func showLocalizationController() {
        let coordinator = LocalizationCoordinator(router: router, assembler: assembler)
        store(coordinator: coordinator)
        coordinator.start()
    }
}
