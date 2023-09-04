import UIKit

enum TabBarPage {
    case main
    case favourite
    case cart
    case profile
    
    init?(index: Int) {
        switch index {
        case 0:
            self = .main
        case 1:
            self = .cart
        case 2:
            self = .favourite
        case 3:
            self = .profile
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .main:
            return "Меню"
        case .favourite:
            return "Избранное"
        case .cart:
            return "Корзина"
        case .profile:
            return "Профиль"
        }
    }
    
    func pageIconValue() -> UIImage {
        switch self {
        case .main:
            return UIImage(systemName: "book.pages.fill")!
        case .favourite:
            return UIImage(systemName: "heart.fill")!
        case .cart:
            return UIImage(systemName: "cart.circle.fill")!
        case .profile:
            return UIImage(systemName: "person.crop.circle.fill")!
        }
    }
}

class BaseTabBarController {
    
    var navigationController = UINavigationController()

    var tabBarController = UITabBarController()
    
    var isLoggedIn: Bool = false
    
    var childCoordinators: [Coordinator] = []
    
    init(_ navigationController: UINavigationController, tabBarController: UITabBarController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        
    }
}
