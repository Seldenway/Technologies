import UIKit
import Combine
import Swinject

enum DynamicColor {
    case primary
    case tableView
    case mainImage
    case themeImage
    case section
}

extension DynamicColor {
    var publisher: AnyPublisher<UIColor?, Never> {
        currentTheme
            .map { $0.uiColor(self) }
            .eraseToAnyPublisher()
    }
    
    private var currentTheme: AnyPublisher<Theme, Never> {
        Assembler.shared.resolve(ThemeManager.self)
            .currentTheme
            .map { switchTheme($0) }
            .eraseToAnyPublisher()
    }
    
    private func switchTheme(_ style: UIUserInterfaceStyle) -> Theme {
        switch style {
        case .light:
            return LightTheme()
        case .dark:
            return DarkTheme()
        case .unspecified:
            return LightTheme()
        @unknown default:
            return LightTheme()
        }
    }
}
