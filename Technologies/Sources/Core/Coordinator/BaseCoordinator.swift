import UIKit
import Combine
import Swinject

class BaseCoordinator: Coordinator {
    
    // MARK: - var
    
    var childCoordinators: [Coordinator] = []
    var cancellables = Set<AnyCancellable>()
    var onEnd: NavigationBackClosure?
    weak var viewController: UIViewController? {
        didSet {
            guard let controller = viewController else { return }
            bindingDeallocate(controller: controller)
        }
    }
    
    // MARK: - Flow function
    
    func start() {
        fatalError("Children should implement `start`.")
    }
    
    private func bindingDeallocate(controller: UIViewController) {
        controller.deallocate
            .sink { [unowned self] in
                onEnd?()
            }
            .store(in: &cancellables)
    }
}

class ContainerCoordinator: BaseCoordinator {
    // MARK: - let
    
    let assembler: Assembler
    
    // MARK: - init
    
    init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    deinit {
        print("DEINIT: \(Self.self)")
    }
}

class RoutingCoordinator: ContainerCoordinator {
    let router: RouterType
    
    init(router: RouterType, assembler: Assembler) {
        self.router = router
        super.init(assembler: assembler)
    }
}
