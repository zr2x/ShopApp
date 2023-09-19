import Foundation

protocol MainViewModel {
    var products: [Product] { get set }
    var reloadTableView: (() -> Void)? { get set }
    var showLoading: (() -> Void)? { get set }
    var hideLoading: (() -> Void)? { get set }
    
    func loadData()
}

class MainViewModelImp: MainViewModel {
    
    
    // MARK: - Variables
    var reloadTableView: (() -> Void)?
    var showLoading: (() -> Void)?
    var hideLoading: (() -> Void)?
    
    // MARK: properties
    var products: [Product] = []
    
    init() {
        createProducts()
    }
    weak var appCoordinator: AppCoordinator?
    
    // MARK: methods
    func loadData() {
        showLoading?()
        ApiClient.getDataFromServer { [weak self] success, _ in
            self?.hideLoading?()
            if success {
                self?.reloadTableView?()
            } else {
                print("Error")
            }
        }
    }
    
    // FIXME: Test func
    func createProducts() {
        for _ in 0...9 {
            let product = Product(productInfo: ProductInfo(image: "", name: "MilkMilkMilkMilkMilkMilkMilkMilkMilkMilkMilkMilk", id: 100, price: "300 rub", deliveryInfo: "30 august", descriptionInfo: DescriptionInfo(count: 111, information: "currently no info available currently no info available currently no info available currently no info available currently no info available currently no info available currently no info available currently no info available currently no info available")))
            let product2 = Product(productInfo: ProductInfo(image: "", name: "Chips", id: 100, price: "150 rub", deliveryInfo: "30 august", descriptionInfo: DescriptionInfo(count: 111, information: "best snack")))
            let product3 = Product(productInfo: ProductInfo(image: "", name: "Tomatoes", id: 100, price: "222 rub", deliveryInfo: "30 august", descriptionInfo: DescriptionInfo(count: 111, information: "Originally tomatoes, from south country. Best taste")))
            products.append(product)
            products.append(product2)
            products.append(product3)
        }
    }
}
