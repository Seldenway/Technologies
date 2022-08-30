import Combine
import UIKit

class AppThemeManager: ThemeManager {
    
    // MARK: - var
    
    private var window: UIWindow {
        guard let window = sceneDelegate?.window
        else { return UIWindow() }
        return window
    }
    
    private var sceneDelegate: SceneDelegate? {
        connectedScenes.first?.delegate as? SceneDelegate
    }
    
    private var connectedScenes: Set<UIScene> {
        UIApplication.shared.connectedScenes
    }
    
    lazy var currentTheme = CurrentValueSubject<UIUserInterfaceStyle, Never>(currentStyle())
    
    // MARK: - deinit
    
    deinit {
        print("============= DEINIT: \(Self.self) =============")
    }
    
    // MARK: - Flow function
    
    private func applyStyle(style: UIUserInterfaceStyle) {
        window.overrideUserInterfaceStyle = style
    }
    
    func setNewStyle(_ style: UIUserInterfaceStyle) {
        applyStyle(style: style)
    }
    
    func setNewStyle(_ theme: ThemeData) {
        let style: UIUserInterfaceStyle
        switch theme {
        case .light:
            style = .light
        case .dark:
            style = .dark
        case .system:
            style = .unspecified
        }
        
        applyStyle(style: style)
    }
    
    func currentStyle() -> UIUserInterfaceStyle {
        window.overrideUserInterfaceStyle
    }
}
