import Foundation
import Combine

enum ThemeData: String, CaseIterable, Codable {
    case light = "Light mode"
    case dark = "Dark mode"
    case system = "System"
    
    var title: AnyPublisher<String?, Never> {
        rawValue.publisher
    }
}
