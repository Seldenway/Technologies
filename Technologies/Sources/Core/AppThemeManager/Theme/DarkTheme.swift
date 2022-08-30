import UIKit

final class DarkTheme: Theme {
    func uiColor(_ color: DynamicColor) -> UIColor? {
        switch color {
        case .primary:
            return .primary
        case .tableView:
            return .primary
        case .mainImage:
            return .salmon
        case .themeImage:
            return .salmon
        case .section:
            return .lightGray
        }
    }
    
    func uiImage(_ image: DynamicImage) -> UIImage? {
        switch image {
        case .arrowRight:
            return .arrowRight
        case .circleCheckmark:
            return .circleCheckmark
        }
    }
}
