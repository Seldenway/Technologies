import UIKit

protocol Theme {
    func uiColor(_ color: DynamicColor) -> UIColor?
    func uiImage(_ image: DynamicImage) -> UIImage?
}
