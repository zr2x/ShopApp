import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        let tabBarController = UITabBarController()
        appCoordinator = AppCoordinator(navigationController)
        appCoordinator?.start()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle

}
