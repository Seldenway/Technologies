import UIKit

extension UIAction {
    var stepper: UIStepper {
        guard let stepper = sender as? UIStepper else { return UIStepper() }
        return stepper
    }
}
