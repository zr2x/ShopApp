import UIKit

protocol Coordinator {
    var navigationController: UINavigationController {get set}
    var isLoggedIn: Bool {get set}
    func start()
}

class AppCoordinator: Coordinator {
    var isLoggedIn = false
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let mainViewController = MainViewController()
        let mainViewModel = MainViewModel()
        mainViewModel.appCoordinator = self
        mainViewController.viewModel = mainViewModel
        navigationController.show(mainViewController, sender: self)
    }
}
