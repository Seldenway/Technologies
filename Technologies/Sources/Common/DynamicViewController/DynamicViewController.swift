import UIKit
import Combine
import Swinject

class DynamicViewController<ViewModel: ConfigurableViewModel>: CancellableViewController {
    
    var prefersLargeTitles: Bool { true }
    var backgroundColor: AnyPublisher<UIColor?, Never> {  DynamicColor.primary.publisher }
    let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = prefersLargeTitles
        backgroundColor
            .assign(to: \.backgroundColor, on: view)
            .store(in: &cancellable)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        Assembler.shared.resolve(ThemeManager.self).currentTheme.send(traitCollection.userInterfaceStyle)
    }
}

class CancellableViewController: UIViewController {
    var cancellable = Set<AnyCancellable>()
}
