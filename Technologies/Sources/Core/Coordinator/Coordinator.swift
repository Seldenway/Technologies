import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var onEnd: NavigationBackClosure? { get set }
    func start()
}

extension Coordinator {
    func store(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.onEnd = { [unowned self, unowned coordinator] in
            free(coordinator: coordinator)
        }
    }
    
    func free(coordinator: Coordinator) {
        childCoordinators.removeAll() { $0 === coordinator }
    }
}
