import Foundation
import Combine

final class LocalizationViewModel: ConfigurableViewModel {
    
    // MARK: - var
    
    private(set) var title = "Localization".publisher
    var text = CurrentValueSubject<String?, Never>("")
    
    // MARK: - init
    
    override func configure() {
        setNewValue(0)
    }
    
    // MARK: - Flow function
    
    func setNewValue(_ value: Double) {
        "pineappleCount".publisher(Int(value))
            .sink { [unowned self] in self.text.send($0) }
            .store(in: &cancellable)
    }
}
