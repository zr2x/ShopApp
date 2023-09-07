import Foundation
import UIKit

protocol MainCoordinatorProtocol: Coordinator {
    func showMainViewController()
}

class MainCoordinator: MainCoordinatorProtocol {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var type: CoordinatorType { .main }

    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showMainViewController()
    }
    
    func showMainViewController() {
        let mainVC = MainViewController()
        navigationController.pushViewController(mainVC, animated: true)
    }
    
    deinit {
        print("MainVC deinit")
    }
}
