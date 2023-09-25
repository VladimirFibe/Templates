import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AnyCoordinator<Void>?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = SystemNavigationController(hideNavigationBar: true)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        let router = ApplicationRouter(rootController: rootViewController)
        let appCoordinator = CoordinatorFactory.shared.makeApplicationCoordinator(router: router)
        appCoordinator.start()
        self.appCoordinator = appCoordinator
        return true
    }
}

