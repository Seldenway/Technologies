import UIKit

class MainViewController: ListViewController<MainViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.title
            .compactMap { $0 }
            .assign(to: \.title, on: self)
            .store(in: &cancellable)
        viewModel.loadData()
    }
}
