import Swinject

class ThemeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ThemeManager.self) { resolver in
            AppThemeManager()
        }
        .inObjectScope(.container)
    }
    
    deinit {
        print("============= DEINIT: \(Self.self) =============")
    }
}
