import Foundation
import Combine

protocol LanguageManager {
    var currentLanguage: CurrentValueSubject<Language, Never> { get set }
}

final class AppLanguageManager: LanguageManager {
    static let shared: LanguageManager = AppLanguageManager()
    private init() {}
    lazy var currentLanguage = CurrentValueSubject<Language, Never>(language)
    
    private var language: Language {
        UserDefaults.standard[.language] ?? .english
    }
}
