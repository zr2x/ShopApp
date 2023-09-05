import UIKit

class AppCoordinator: Coordinator {
    
    var isLoggedIn = false
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
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
}
