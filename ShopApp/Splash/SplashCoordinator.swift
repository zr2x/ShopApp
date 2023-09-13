//
//  SplashCoordinator.swift
//  ShopApp
//
//  Created by Искандер Ситдиков on 12.09.2023.
//

import Foundation
import UIKit

class SplashCoordinator: Coordinator {
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType { .main }
    
    func start() {
        let splashVC = SplashViewController()
        navigationController.pushViewController(splashVC, animated: true)
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
}

extension SplashCoordinator {
    func didCompleteSplashScreen() {
        
    }
    
    private func startTabBarCoordinator() {
        let tabBarCoordinator = TabBarCoordinator(navigationController)
        tabBarCoordinator.start()
    }
}
