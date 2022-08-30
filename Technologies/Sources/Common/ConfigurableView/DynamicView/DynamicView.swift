import UIKit
import Swinject

class DynamicView: UIView {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        Assembler.shared.resolve(ThemeManager.self).currentTheme.send(traitCollection.userInterfaceStyle)
    }
}
