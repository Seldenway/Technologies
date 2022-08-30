import Foundation
import Combine

extension String {
    private func localizedBundle(for localization: Language) -> Bundle? {
        guard let localizedPath = Bundle.main.path(forResource: localization.rawValue, ofType: "lproj"),
              let localizedBundle = Bundle(path: localizedPath) else {
            return nil
        }
        return localizedBundle
    }
    
    private func localizedString(in bundle: Bundle?) -> String {
        guard let bundle = bundle else {
            return NSLocalizedString(self, comment: "\(self)_comment")
        }
        return bundle.localizedString(forKey: self, value: nil, table: nil)
    }
    
    private func localized(_ localization: Language? = nil) -> String {
        let localization = localization ?? AppLanguageManager.shared.currentLanguage.value
        return localizedString(in: localizedBundle(for: localization))
    }
    
    private func localized(_ arg: CVarArg) -> String {
        String(format: localized(), arg)
    }
    
    func publisher(_ arg: CVarArg) -> AnyPublisher<String?, Never> {
        AppLanguageManager.shared
            .currentLanguage
            .map { _ in localized(arg) }
            .eraseToAnyPublisher()
    }
    
    var publisher: AnyPublisher<String?, Never> {
        AppLanguageManager.shared
            .currentLanguage
            .map { localized($0) }
            .eraseToAnyPublisher()
    }
}
