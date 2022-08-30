import UIKit
import Combine

final class TableViewDataSourceDelegate: UITableViewDiffableDataSource<TableViewSection, TableViewItem> {
    private(set) var items: [TableViewItem]
    
    init(_ tableView: UITableView, items: [TableViewItem]) {
        self.items = items
        super.init(tableView: tableView) { tableView, indexPath, item in
            item.cellConfigurator.registerAndDequeueConfiguredCell(for: tableView, indexPath: indexPath)
        }
        
        tableView.delegate = self
    }
    
    deinit {
        print("DEINIT: \(Self.self)")
    }
}


extension TableViewDataSourceDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        sectionIdentifier(for: section)?.headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        sectionIdentifier(for: section)?.footerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = itemIdentifier(for: indexPath) else { return }
        item.action()
    }
}
