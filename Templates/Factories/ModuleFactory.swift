import Foundation

protocol ModuleFactoryProtocol: AnyObject {
    func makeHelloModule() -> Presentable
}

final class ModuleFactory: ModuleFactoryProtocol {
    static let shared = ModuleFactory()
    private init() {}

    func makeHelloModule() -> Presentable {
        HelloViewController()
    }
}
