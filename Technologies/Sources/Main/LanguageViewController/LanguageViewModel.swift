import Combine
import Foundation

final class LanguageViewModel: TableViewModel {
    
    // MARK: - var
    
    private(set) var title = "Current language".publisher
    
    // MARK: - Flow function
    
    override func loadData() {
        setDataSource(createCells())
    }
    
    private func createCells() -> [TableViewItem] {
        Language.allCases.map { languageCell($0) }
    }
    
    private func languageCell(_ data: Language) -> TableViewItem {
        .languageCell(data) { [unowned self] in
            UserDefaults.standard[.language] = data
            AppLanguageManager.shared.currentLanguage.send(data)
            reloadData()
        }
    }
}
