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

protocol TabBarCoordinatorProtocol: AppCoordinator {
    var tabBarController: UITabBarController { get set }
    
    func selectPage(_ page: TabBarPage)
    
    func setSelectedIndex(_ index: Int)
    
    func currentPage() -> TabBarPage?
}

class TabBarController: Coordinator {
   
    
    var navigationController: UINavigationController
    
    var isLoggedIn: Bool
    
    var childCoordinators: [Coordinator]
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        <#code#>
    }
    
  
}
