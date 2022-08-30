import Foundation

protocol MainViewModelDelegate:
    AnyObject,
    ThemeViewModelDelegate,
    LanguageViewModelDelegate,
    LocalizationViewModelDelegate
{
    func showNextScreen(_ data: CommonData)
}
