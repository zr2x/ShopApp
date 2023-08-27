import Foundation

protocol MainViewModelProtocol {
    func fetchProduct()
}

class MainViewModel: MainViewModelProtocol {

    // MARK: properties
    var product: Product?
    weak var appCoordinator: AppCoordinator?
    
    // MARK: methods
    func numberOfSection() -> Int {
        return 2
    }
    
    func numberOfRow(in section: Int) -> Int {
        return 5
    }
    
    func someFunc() {
        appCoordinator?.start()
    }
    
    func fetchProduct() {
        
    }
}
