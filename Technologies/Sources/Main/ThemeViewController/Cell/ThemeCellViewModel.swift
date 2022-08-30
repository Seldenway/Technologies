import Combine
import Foundation
import Swinject

protocol ThemeCellViewModelType {
    var title: AnyPublisher<String?, Never> { get }
    var image: DynamicImage? { get }
}

final class ThemeCellViewModel: ConfigurableViewModel, ThemeCellViewModelType {
    
    // MARK: - var
    
    var image: DynamicImage? { loadImage() }
    
    // MARK: - let
    
    let title: AnyPublisher<String?, Never>
    private let data: ThemeData
    
    init(data: ThemeData) {
        title = data.title
        self.data = data
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadImage() -> DynamicImage? {
        let theme = UserDefaults.standard[.darkMode]
        let circleCheckmark = data == theme ? DynamicImage.circleCheckmark : nil
        return circleCheckmark
    }
}

extension TableViewItem {
    static func themeCell(_ data: ThemeData, action: @escaping Closure) -> TableViewItem {
        TableViewItem(
            configurator: TableViewDefaultCellModel(
                cellType: ThemeCell.self,
                viewModel: ThemeCellViewModel(data: data),
                rowHeight: 50
            ),
            action: action
        )
    }
}
