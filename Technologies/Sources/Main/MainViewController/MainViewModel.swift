import Combine
import UIKit

final class MainViewModel: TableViewModel {
    
    // MARK: - var
    
    weak var delegate: MainViewModelDelegate?
    override var shouldReloadSection: Bool { true }
    
    // MARK: - let
    
    private(set) var title = "Welcome".publisher
    
    // MARK: - Flow function
    
    override func loadData() {
        setDataSource(createCells())
    }
    
    private func createCells() -> [TableViewItem] {
        CommonData.allCases
            .map { mainCell($0) }
    }
    
    private func mainCell(_ data: CommonData) -> TableViewItem {
        .mainCell(data) { [unowned self] in
           switchData(data)
        }
    }
    
    private func switchData(_ data: CommonData) {
        delegate?.showNextScreen(data)
    }
}
