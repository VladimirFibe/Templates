import Foundation

protocol CoordinatorFactoryProtocol: AnyObject {
    func makeApplicationCoordinator(router: Routable) -> AnyCoordinator<Void>
    func makeHelloCoordinator(parent: BaseCoordinator, router: Routable) -> AnyCoordinator<Void>
}

final class CoordinatorFactory: CoordinatorFactoryProtocol {
    static let shared = CoordinatorFactory()
    private init() {}
    
    func makeApplicationCoordinator(router: Routable) -> AnyCoordinator<Void> {
        AnyCoordinator(ApplicationCoordinator(
            router: router,
            coordinatorFactory: self
        ))
    }
    
    func makeHelloCoordinator(parent: BaseCoordinator, router: Routable) -> AnyCoordinator<Void> {
        let coordinator = AnyCoordinator(HelloCoordinator(
            router: router,
            parent: parent,
            moduleFactory: ModuleFactory.shared,
            coordinatorFactory: self
        ))
        return coordinator
    }
}
