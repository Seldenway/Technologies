import Combine
import Foundation
import Swinject

final class ThemeViewModel: TableViewModel {
    
    // MARK: - var
    
    private(set) var title = "Current theme".publisher
    
    // MARK: - Flow function
    
    override func loadData() {
        setDataSource(createCells())
    }
    
    private func createCells() -> [TableViewItem] {
        ThemeData.allCases.map { themeCell($0) }
    }
    
    private func themeCell(_ data: ThemeData) -> TableViewItem {
        .themeCell(data) { [unowned self] in
            UserDefaults.standard[.darkMode] = data
            changeTheme(data)
            reloadData()
        }
    }
    
    private func changeTheme(_ theme: ThemeData) {
        Assembler.shared.resolve(ThemeManager.self).setNewStyle(theme)
    }
}
