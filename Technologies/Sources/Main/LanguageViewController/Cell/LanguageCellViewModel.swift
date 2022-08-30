import Foundation
import Combine

protocol LanguageCellViewModelType {
    var title: AnyPublisher<String?, Never> { get }
}

final class LanguageCellViewModel: ConfigurableViewModel, LanguageCellViewModelType {
    
    // MARK: - var
    
    var image: DynamicImage? { loadImage() }
    
    // MARK: - let
    
    let title: AnyPublisher<String?, Never>
    private let language: Language
    
    // MARK: - init
    
    init(data: Language) {
        title = data.title
        self.language = data
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadImage() -> DynamicImage? {
        let savedLanguage = UserDefaults.standard[.language]
        let circleCheckmark = language == savedLanguage ? DynamicImage.circleCheckmark : nil
        return circleCheckmark
    }
}

extension TableViewItem {
    static func languageCell(_ data: Language, action: @escaping Closure) -> TableViewItem {
        TableViewItem(
            configurator: TableViewDefaultCellModel(
                cellType: LanguageCell.self,
                viewModel: LanguageCellViewModel(data: data),
                rowHeight: 50
            ),
            action: action
        )
    }
}
