//
//  Product.swift
//  ShopApp
//
//  Created by Искандер Ситдиков on 20.08.2023.
//

import Foundation

struct Product {
    let product: ProductInfo
}

struct ProductInfo {
    let image: String
    let name: String
    let id: Int
    let price: Int
    let deliveryInfo: String
    let descriptionInfo: DescriptionInfo
}

struct DescriptionInfo {
    let count: Int
    let information: String
}
