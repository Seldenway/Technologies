import UIKit
import Combine

protocol ThemeManager {
    var currentTheme: CurrentValueSubject<UIUserInterfaceStyle, Never> { get set }
    func setNewStyle(_ style: UIUserInterfaceStyle)
    func setNewStyle(_ theme: ThemeData)
    func currentStyle() -> UIUserInterfaceStyle
}
