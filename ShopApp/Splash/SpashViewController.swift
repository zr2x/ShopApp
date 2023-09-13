//
//  SpashViewController.swift∫
//  ShopApp
//
//  Created by Искандер Ситдиков on 12.09.2023.
//

import UIKit
import Lottie


final class SplashViewController: UIViewController {
    
    private var animationView = LottieAnimationView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
        startSplash()
        view.backgroundColor = .white
    }
    
    
    // MARK: - Start app
    private func startMainFlow() {
        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .overFullScreen
        navigationController?.pushViewController(mainVC, animated: true)
    }
    
    private func startSplash() {
        view.addSubview(animationView)
        animationView.play(toProgress: 1, loopMode: .playOnce) { finished in
            if finished {
                self.startMainFlow()
                
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    self.animationView.stop()
                }
            }
        }
    }
    
    private func setupAnimation() {
        view.addSubview(animationView)
        animationView.animation = LottieAnimation.named("splash")
        animationView.frame = view.bounds
        animationView.center = view.center
        animationView.contentMode = .scaleAspectFit
    }
}
