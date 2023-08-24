import Foundation

struct Product {
    let productInfo: ProductInfo
    
}

struct ProductInfo {
    let image: String
    let name: String
    let id: Int
    let price: String
    let deliveryInfo: String
    let descriptionInfo: DescriptionInfo
}

struct DescriptionInfo {
    let count: Int
    let information: String
}

extension Product {
    static var productInfo = ProductInfo(image: "1", name: "Milk", id: 10, price: "300 rub", deliveryInfo: "August", descriptionInfo: DescriptionInfo(count: 10, information: "Organic Milk"))
}
