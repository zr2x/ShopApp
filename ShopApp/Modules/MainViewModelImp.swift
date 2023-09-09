import Foundation

protocol MainViewModel {
    var products: [Product] { get set }
    var reloadTableView: (() -> Void)? { get set }
    var showLoading: (() -> Void)? { get set }
    var hideLoading: (() -> Void)? { get set }
    
    func updateData()
    
}

class MainViewModelImp: MainViewModel {
    
    // MARK: - Variables
    var reloadTableView: (() -> Void)?
    var showLoading: (() -> Void)?
    var hideLoading: (() -> Void)?
    
    // MARK: properties
//    var products = [Product]()
    var products = [
        Product(productInfo: ProductInfo(image: "image1", name: "Milk", id: 100, price: "300 rub", deliveryInfo: "30 august", descriptionInfo: DescriptionInfo(count: 111, information: "currently no info available"))),
        Product(productInfo: ProductInfo(image: "image2", name: "Chips", id: 100, price: "555 rub", deliveryInfo: "30 august", descriptionInfo: DescriptionInfo(count: 111, information: "great choice to eat some snacks")))]
    weak var appCoordinator: AppCoordinator?
    
    // MARK: methods
    func updateData() {
        showLoading?()
        ApiClient.getDataFromServer { [weak self] success, data in
            self?.hideLoading?()
            if success {
                self?.reloadTableView?()
            } else {
                print("Error")
            }
        }

    }
}
