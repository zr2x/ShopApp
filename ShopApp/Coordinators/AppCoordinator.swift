import UIKit

class AppCoordinator: Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var isLoggedIn = false
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .app }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    func start() {
        let mainCoordinator = MainCoordinator(navigationController)
        mainCoordinator.finishDelegate = self
        mainCoordinator.start()
        childCoordinators.append(mainCoordinator)
        
    }
    
    func startTabBarFlow() {
//        let splashCoordinator = SplashCoordinator(navigationController)
//        splashCoordinator.finishDelegate = self
//        splashCoordinator.start()
//        childCoordinators.append(splashCoordinator)
        let tabBarCoordinator = TabBarCoordinator(navigationController)
        tabBarCoordinator.finishDelegate = self
        tabBarCoordinator.start()
        childCoordinators.append(tabBarCoordinator)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        
        switch childCoordinator.type {
        case .tab:
            navigationController.viewControllers.removeAll()
            startTabBarFlow()
        case .main:
            navigationController.viewControllers.removeAll()
            startTabBarFlow()
        default:
            break
        }
    }
}
