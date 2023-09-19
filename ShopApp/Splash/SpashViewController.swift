//
//  SpashViewController.swift∫
//  ShopApp
//
//  Created by Искандер Ситдиков on 12.09.2023.
//

import UIKit
import Lottie


final class SplashViewController: UIViewController {
    
    // MARK: - Variable
    
    weak var splashCoordinator: SplashCoordinator?
    private var animationView = LottieAnimationView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
        startSplash()
        view.backgroundColor = .white
    }
    
    
    // MARK: - Start splash
    
    private func startSplash() {
        view.addSubview(animationView)
        animationView.play(toProgress: 1, loopMode: .playOnce) { finished in
            if finished {
                self.splashCoordinator?.start()
                
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    self.animationView.stop()
                    
                }
            }
        }
    }
    
    // MARK: - Setup views
    
    private func setupAnimation() {
        view.addSubview(animationView)
        animationView.animation = LottieAnimation.named("splash")
        animationView.frame = view.bounds
        animationView.center = view.center
        animationView.contentMode = .scaleAspectFit
    }
}
