import Foundation

protocol ProductProtocol {
    func fetchProduct()
    
}

class MainViewModel {
    
    // MARK: methods
    func numberOfSection() -> Int {
        return 5
    }
    
    func numberOfRow(in section: Int) -> Int {
        return 10
    }
    
}
