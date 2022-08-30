import UIKit
import Combine

class ListViewController<ViewModel: CommonListViewModel>: DynamicViewController<ViewModel> {
    
    // MARK: - var
    
    var tableViewStyle: UITableView.Style { .insetGrouped }
    private lazy var tableView: TableView = {
        let tableView = TableView(style: tableViewStyle)
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    var tableViewBackgroundColor: AnyPublisher<UIColor?, Never> { DynamicColor.tableView.publisher }
    
    // MARK: - let
    
    private let container = UIView()

    // MARK: - Lifecycle function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addContainer()
        addTableView()
        bindViewModel()
        bindColors()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTableView()
    }
    
    // MARK: - Flow function
    
    private func addContainer() {
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.topAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func addTableView() {
        container.addSubview(tableView)
        NSLayoutConstraint.activate(tableView.layoutConstraints(in: container))
    }
    
    private func updateTableView() {
        guard viewModel.shouldReloadSection else { return }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    private func bindColors() {
        tableViewBackgroundColor
            .assign(to: \.backgroundColor, on: tableView)
            .store(in: &cancellable)
    }
    
    private func bindViewModel() {
        viewModel.set(tableView)
        viewModel.dataSource
            .sink { [weak self] in
                self?.applySnapshot($0)
            }
            .store(in: &cancellable)
    }
    
    private func applySnapshot(_ dataSource: TableViewDataSourceDelegate) {
        var snapshot = NSDiffableDataSourceSnapshot<TableViewSection, TableViewItem>()
        dataSource.items.forEach { item in
            let elements = dataSource.items.filter { $0.section == item.section }
            guard !snapshot.sectionIdentifiers.contains(item.section) else { return }
            snapshot.appendSections([item.section])
            snapshot.appendItems(elements, toSection: item.section)
        }
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
