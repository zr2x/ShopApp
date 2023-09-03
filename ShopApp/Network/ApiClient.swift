//
//  ApiClient.swift
//  ShopApp
//
//  Created by Искандер Ситдиков on 31.08.2023.
//

import Foundation

public struct ApiClient {
    
    static func getDataFromServer( complete: @escaping (_ success: Bool, _ data: [Product]? ) -> Void ) {
        DispatchQueue.global().async {
            sleep(2)
            var products = [Product]()
            for _ in 0...14 {
                products.append(Product(productInfo: ProductInfo(image: "image", name: "Milk", id: 11, price: "300 rub", deliveryInfo: "Septerber", descriptionInfo: DescriptionInfo(count: 123, information: "Best milk ever"))))
            }
            complete(true, products)
        }
    }
}
