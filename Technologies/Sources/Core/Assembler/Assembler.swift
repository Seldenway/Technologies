import Swinject

extension Assembler {
    static let shared: Assembler = {
        let container = Container()
        let assembler = Assembler(
            [
                ThemeAssembly()
            ],
            container: container
        )
        
        return assembler
    }()
}

extension Assembler {
    func resolve<Service>(_ serviceType: Service.Type) -> Service {
        guard let service = resolver.resolve(serviceType) else {
            fatalError("Please, fasten all your services, especially \(serviceType)")
        }
        return service
    }
    
    func resolve<Service>(_ serviceType: Service.Type, name: String?) -> Service {
        guard let service = resolver.resolve(serviceType, name: name) else {
            fatalError("Please, fasten all your services, especially \(serviceType) named \(String(describing: name))")
        }
        return service
    }
    
    func resolve<Service, Arg>(_ serviceType: Service.Type, argument: Arg) -> Service {
        guard let service = resolver.resolve(serviceType, argument: argument) else {
            fatalError("Please, fasten all your services, especially \(serviceType) with \(argument)")
        }
        return service
    }
    
    func resolve<Service, Arg1, Arg2>(
        _ serviceType: Service.Type,
        argument1: Arg1,
        argument2: Arg2
    ) -> Service {
        guard let service = resolver.resolve(
            serviceType,
            arguments: argument1,
            argument2) else {
            fatalError("Please, fasten all your services, especially \(serviceType) with \(argument1) and \(argument2)")
        }
        return service
    }
    
    func autoResolve<Service>() -> Service {
        resolve(Service.self)
    }
    
    func autoResolve<Service>(name: String?) -> Service {
        resolve(Service.self, name: name)
    }
    
    func autoResolve<Service, Arg>(argument: Arg) -> Service {
        resolve(Service.self, argument: argument)
    }
    
    func autoResolve<Service, Arg1, Arg2>(
        argument1: Arg1,
        argument2: Arg2
    ) -> Service {
        resolve(Service.self, argument1: argument1, argument2: argument2)
    }
}
