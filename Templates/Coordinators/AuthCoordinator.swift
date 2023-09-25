import Foundation

final class HelloCoordinator: BaseCoordinator {
    private let moduleFactory: ModuleFactoryProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol

    init(
        router: Routable,
        parent: BaseCoordinator,
        moduleFactory: ModuleFactoryProtocol,
        coordinatorFactory: CoordinatorFactoryProtocol
    ) {
        self.moduleFactory = moduleFactory
        self.coordinatorFactory = coordinatorFactory
        super.init(router: router, parent: parent)
    }
}

extension HelloCoordinator: Coordinator {
    func start(with option: Void) {
        showInitial()
    }
}

extension HelloCoordinator {
    func showInitial() {
        let module = moduleFactory.makeHelloModule()
        router.setRootModule(module, transition: nil)
    }
}
