import UIKit
import Combine

final class LanguageViewController: ListViewController<LanguageViewModel> {
    
    // MARK: - Lifecycle function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    // MARK: - Flow funciton
    
    private func bindViewModel() {
        viewModel.loadData()
        viewModel.title
            .assign(to: \.title, on: self)
            .store(in: &cancellable)
    }
}
