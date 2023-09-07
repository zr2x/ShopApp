import UIKit

class AppCoordinator: Coordinator {
    
    var isLoggedIn = false
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    func start() {
        let mainCoordinator = MainCoordinator(navigationController)
        mainCoordinator.start()
        childCoordinators.append(mainCoordinator)
        
    }
    
    func startTabBarFlow() {
        let tabBarCoordinator = TabBarCoordinator(navigationController)
        tabBarCoordinator.start()
        childCoordinators.append(tabBarCoordinator)
    }
}
