import Combine
import UIKit
import ObjectiveC

final class DeallocPublisher {
    let subject = PassthroughSubject<Void, Never>()
    init() {}
    deinit {
        subject.send(())
    }
}

extension UIViewController {
    private func synchronized<T>( _ action: () -> T) -> T {
        objc_sync_enter(self)
        let result = action()
        objc_sync_exit(self)
        return result
    }
    
    private enum Dealloc {
        static var associationKey: UInt8 = 0
    }
    
    var deallocate: AnyPublisher<Void, Never> {
        synchronized {
            if let subject = objc_getAssociatedObject(self, &Dealloc.associationKey) as? DeallocPublisher {
                return subject.subject.eraseToAnyPublisher()
            }
            
            let deallocatePublisher = DeallocPublisher()
            objc_setAssociatedObject(self, &Dealloc.associationKey, deallocatePublisher, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return deallocatePublisher.subject.eraseToAnyPublisher()
        }
    }
}
