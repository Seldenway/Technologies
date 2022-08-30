import Foundation

extension MainViewModelDelegate {
    func showNextScreen(_ data: CommonData) {
        switch data {
        case .appTheme: showThemeController()
        case .language: showLanguageController()
        case .localization: showLocalizationController()
        case .debug: break
        }
    }
}
