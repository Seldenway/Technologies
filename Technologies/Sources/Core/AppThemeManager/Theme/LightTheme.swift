import UIKit

final class LightTheme: Theme {
    func uiColor(_ color: DynamicColor) -> UIColor? {
        switch color {
        case .primary:
            return .white
        case .tableView:
            return .tableView
        case .mainImage:
            return .lightSalmon
        case .themeImage:
            return .paleGreen
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
