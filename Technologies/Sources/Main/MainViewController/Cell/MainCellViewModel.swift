import Combine
import Foundation

protocol MainCellViewModelType {
    var title: AnyPublisher<String?, Never> { get }
}

final class MainCellViewModel: ConfigurableViewModel, MainCellViewModelType {
    let title: AnyPublisher<String?, Never>
    
    init(data: CommonData) {
        title = data.title
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TableViewItem {
    static func mainCell(_ data: CommonData, action: @escaping Closure) -> TableViewItem {
        TableViewItem(
            configurator: TableViewDefaultCellModel(
                cellType: MainCell.self,
                viewModel: MainCellViewModel(data: data),
                rowHeight: 50
            ),
            section: data.section,
            action: action
        )
    }
}
