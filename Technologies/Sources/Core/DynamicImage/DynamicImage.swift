import UIKit
import Combine
import Swinject

enum DynamicImage {
    case arrowRight
    case circleCheckmark
}

extension DynamicImage {
    var publisher: AnyPublisher<UIImage?, Never> {
        currentTheme
            .map { $0.uiImage(self) }
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

extension DynamicImage {
    func publisher(with tintColor: DynamicColor) -> AnyPublisher<UIImage?, Never> {
        publisher
            .combineLatest(tintColor.publisher)
            .map { image, color in
                guard let color = color else { return nil }
                return image?.withRenderingMode(.alwaysOriginal).withTintColor(color)
            }
            .eraseToAnyPublisher()
    }
}
