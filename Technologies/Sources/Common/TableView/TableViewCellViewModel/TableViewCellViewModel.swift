import UIKit

protocol ConfigurableTableViewCell: UITableViewCell {
    associatedtype ViewModelType: AnyObject
    var viewModel: ViewModelType? { get set }
}

protocol TableViewCellConfigurator {
    func registerAndDequeueConfiguredCell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell?
}

protocol TableViewCellModel: TableViewCellConfigurator {
    associatedtype Cell: ConfigurableTableViewCell
    var viewModel: Cell.ViewModelType? { get }
    var cellType: Cell.Type { get }
    var rowHeight: CGFloat { get }
    var estimatedRowHeight: CGFloat { get }
    init(
        cellType: Cell.Type,
        viewModel: Cell.ViewModelType?,
        rowHeight: CGFloat?,
        estimatedRowHeight: CGFloat?
    )

}

extension TableViewCellModel {
    func registerAndDequeueConfiguredCell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell? {
        tableView.register(Cell.self, forCellReuseIdentifier: Cell.reuseIdentifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell
        cell?.viewModel = viewModel
        tableView.rowHeight = rowHeight
        tableView.estimatedRowHeight = estimatedRowHeight
        return cell
    }
}

final class TableViewDefaultCellModel<T: ConfigurableTableViewCell>: TableViewCellModel {
    typealias Cell = T
    var cellType: T.Type
    var viewModel: T.ViewModelType?
    var rowHeight: CGFloat
    var estimatedRowHeight: CGFloat

    required init(
        cellType: Cell.Type,
        viewModel: Cell.ViewModelType?,
        rowHeight: CGFloat? = nil,
        estimatedRowHeight: CGFloat? = nil
    ) {
        self.cellType = cellType
        self.viewModel = viewModel
        self.rowHeight = rowHeight ?? UITableView.automaticDimension
        self.estimatedRowHeight = estimatedRowHeight ?? UITableView.automaticDimension
    }
}
