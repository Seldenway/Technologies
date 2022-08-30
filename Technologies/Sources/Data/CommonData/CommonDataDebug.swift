import Foundation
import Combine

enum CommonData: Int, CaseIterable, TableViewSectionType  {
    case appTheme = 0
    case language
    case localization
    case debug
    
    var title: AnyPublisher<String?, Never> {
        switch self {
        case .appTheme: return "Dark mode".publisher
        case .language: return "Language".publisher
        case .localization: return "Localization".publisher
        case .debug: return "Debug".publisher
        }
    }
    
    var section: TableViewSection {
        let title: String
        switch self {
        case .appTheme:
            title = "Here you can turn on dark mode and select light mode or select system."
        case .language:
            title = "Here you can see how language can dynamicly change without app killing."
        case .localization:
            title = "Here you can see how endings for all localization dynamicly change when you set different values."
        case .debug:
            title = "Here you can debug your app!"
        }
        return .footer(section: id, view: CommonSection(title: title))
    }
    
    var id: Int { rawValue }
}
