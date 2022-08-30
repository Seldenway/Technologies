import Foundation

protocol LanguageViewModelDelegate {
    func showLanguageController()
}

extension LanguageViewModelDelegate where Self: RoutingCoordinator {
    func showLanguageController() {
        let coordinator = LanguageCoordinator(router: router, assembler: assembler)
        store(coordinator: coordinator)
        coordinator.start()
    }
}
