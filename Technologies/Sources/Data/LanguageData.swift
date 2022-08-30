import Foundation
import Combine

enum Language: String, CaseIterable, Codable {
    case english = "en"
    case russian = "ru"
    
    var title: AnyPublisher<String?, Never> {
        switch self {
        case .english: return "English".publisher
        case .russian: return "Russian".publisher
        }
    }
}
