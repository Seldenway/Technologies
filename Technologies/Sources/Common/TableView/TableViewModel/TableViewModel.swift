import Combine
import Foundation
import Swinject

protocol AbstractTableViewModelType {
    var dataSource: CurrentValueSubject<TableViewDataSourceDelegate, Never> { get }
    var shouldReloadSection: Bool { get }
    func set(_ tableView: TableView)
    func loadData()
}

class TableViewModel: CommonListViewModel {
    
    // MARK: - var
    private var tableView: TableView?
    private(set) lazy var dataSource = CurrentValueSubject<TableViewDataSourceDelegate, Never>(emptyDataSource)
    var shouldReloadSection: Bool { false }
    
    // MARK: - let
    
    private let emptyDataSource = TableViewDataSourceDelegate(TableView(style: .insetGrouped), items: [])
    
    // MARK: - init
    
    override init() {
        super.init()
        bindAppTheme()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDataSource(_ items: [TableViewItem]) {
        guard let tableView = tableView else { return }
        let source = TableViewDataSourceDelegate(tableView, items: items)
        dataSource.send(source)
    }
    
    func reloadData(animated: Bool = false) {
        var snapshot = dataSource.value.snapshot()
        let items = snapshot.itemIdentifiers
        guard !items.isEmpty else { return }
        snapshot.reloadItems(items)
        dataSource.value.apply(snapshot, animatingDifferences: animated)
    }

    func set(_ tableView: TableView) {
        self.tableView = tableView
    }
    
    func loadData() {}
    
    private func bindAppTheme() {
        Assembler.shared.resolve(ThemeManager.self).currentTheme
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] _ in
                reloadData()
            }
            .store(in: &cancellable)
    }
    
    deinit {
        print("DEINIT: \(Self.self)")
    }
}
