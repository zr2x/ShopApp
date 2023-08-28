import Foundation

protocol MainViewModel {
    func fetchProduct()
    var products: [Product] { get set }
}

class MainViewModelImp: MainViewModel {

    // MARK: properties
//    var products = [Product]()
    var products = [
        Product(productInfo: ProductInfo(image: "image1", name: "Milk", id: 100, price: "300 rub", deliveryInfo: "30 august", descriptionInfo: DescriptionInfo(count: 111, information: "no info"))),
        Product(productInfo: ProductInfo(image: "image2", name: "Chips", id: 100, price: "555 rub", deliveryInfo: "30 august", descriptionInfo: DescriptionInfo(count: 111, information: "no info")))]
    weak var appCoordinator: AppCoordinator?
    
    // MARK: methods
    func someFunc() {
        appCoordinator?.start()
    }
    
    func fetchProduct() {
        
    }
}
