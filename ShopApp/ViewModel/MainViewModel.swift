import Foundation

protocol ProductProtocol {
    func fetchProduct()
    
}

class MainViewModel {
    
    var product: Product?
    weak var appCoordinator: AppCoordinator?
    
    // MARK: methods
    func numberOfSection() -> Int {
        return 5
    }
    
    func numberOfRow(in section: Int) -> Int {
        return 10
    }
    
    func someFunc() {
        appCoordinator?.start()
    }
    
}
