//
//  NetworkMapper.swift
//  ShopApp
//
//  Created by Искандер Ситдиков on 15.09.2023.
//

import Foundation

protocol NetworkMapperProtocol {
    associatedtype ResponseType
    func mapResponse(data: Data) -> [ResponseType]
}

class NetworkMapper: NetworkMapperProtocol {
    
    typealias ResponseType = ImagesModel
    
    func mapResponse(data: Data) -> [ImagesModel] {
        let imagesModel = try? JSONDecoder().decode([ImagesModel].self, from: data)
        
        return imagesModel ?? []
    }
}
