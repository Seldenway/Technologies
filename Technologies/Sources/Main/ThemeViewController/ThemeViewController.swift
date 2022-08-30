import UIKit

final class ThemeViewController: ListViewController<ThemeViewModel> {
    
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
