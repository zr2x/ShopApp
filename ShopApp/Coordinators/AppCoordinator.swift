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
        let mainViewController = MainViewController()
        let mainViewModel = MainViewModelImp()
        mainViewModel.appCoordinator = self
        mainViewController.viewModel = mainViewModel
        navigationController.show(mainViewController, sender: self)
    }
    
    func showMainFlow() {
        let tabBarCoordinator = TabBarCoordinator(navigationController)
        tabBarCoordinator.start()
        childCoordinators.append(tabBarCoordinator)
    }
}
