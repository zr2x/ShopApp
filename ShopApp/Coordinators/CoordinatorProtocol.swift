import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var isLoggedIn: Bool {get set}
    var childCoordinators: [Coordinator] { get set }
    
    func start()
    func finish()
    
    init(_ navigationController: UINavigationController)
}

extension Coordinator {
    func finish() {
        childCoordinators.removeAll()
    }
}
