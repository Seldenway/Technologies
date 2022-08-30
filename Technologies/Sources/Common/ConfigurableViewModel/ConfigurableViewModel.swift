import Combine
import Foundation

class ConfigurableViewModel: CancellableViewModel {
    override init() {
        super.init()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {}
}

class CancellableViewModel {
    var cancellable = Set<AnyCancellable>()
}
