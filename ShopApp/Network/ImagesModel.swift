//
//  ImagesModel.swift
//  ShopApp
//
//  Created by Искандер Ситдиков on 15.09.2023.
//

import Foundation

struct ImagesModel: Decodable {
    
    let id: String // ID photo
    let width: Int
    let height: Int
    let user: User
    let urls: ImageSize
}

//MARK: User
struct User: Decodable {
    let id: String
    let username: String
    
}

// MARK: - Urls
struct ImageSize: Codable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}
