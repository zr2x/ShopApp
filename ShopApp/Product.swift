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
