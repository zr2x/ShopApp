//
//  ProfileCoordinator.swift
//  ShopApp
//
//  Created by Искандер Ситдиков on 19.09.2023.
//

import UIKit

class ProfileCoordinator: Coordinator {
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType { .main }

    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showProfileViewController()
    }
    
    func showProfileViewController() {
        let profileVC = ProfileViewController()
        navigationController.pushViewController(profileVC, animated: true)
    }
    
}
