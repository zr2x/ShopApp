import UIKit

protocol Coordinator {
    var navigationController: UINavigationController {get set}
    
    func start()
}

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
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
