//
//  NetworkMapper.swift
//  ShopApp
//
//  Created by Искандер Ситдиков on 15.09.2023.
//

import Foundation

class NetworkMapper {
    
    func mapResponse(data: Data) -> [ImagesModel] {
        let imagesModel = try? JSONDecoder().decode([ImagesModel].self, from: data)
        
        return imagesModel ?? []
    }
}
