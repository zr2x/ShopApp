import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    var tabBarController: UITabBarController { get set } // not sure about this
    var isLoggedIn: Bool {get set}
    var childCoordinators: [Coordinator] { get set }
    func start()
}

class AppCoordinator: Coordinator {
    var tabBarController: UITabBarController
    var isLoggedIn = false
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController, tabBarController: UITabBarController) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
    }
    
    func start() {
        
        let mainViewController = MainViewController()
        let mainViewModel = MainViewModelImp()
        mainViewModel.appCoordinator = self
        mainViewController.viewModel = mainViewModel
        navigationController.show(mainViewController, sender: self)
    }
}
