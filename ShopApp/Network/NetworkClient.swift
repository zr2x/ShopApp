//
//  NetworkClient.swift
//  ShopApp
//
//  Created by Искандер Ситдиков on 15.09.2023.
//

import Foundation

enum NetworkError: Error {
    case badURL, dataNotExist, selfNoExist
}

protocol NetworkClient {
    associatedtype ResponseType: Decodable
    func fetchImages(completion: @escaping (Result<ResponseType, NetworkError>) -> Void)
}

class NetworkClientImp: NetworkClient {
    typealias ResponseType = [ImagesModel]
    
    private let mapper: NetworkMapper
    private let urlComponents = URLComponents()
    
    init(mapper: NetworkMapper) {
        self.mapper = mapper
    }
    
    func fetchImages(completion: @escaping (Result<[ImagesModel], NetworkError>) -> Void) {
        guard let url = URL(string: urlComponents.scheme + urlComponents.api + urlComponents.accessKey) else { completion(.failure(.badURL))
            return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self else { return completion(.failure(.selfNoExist))}
            guard let data else {  return completion(.failure(.dataNotExist))}
            let imagesModel = self.mapper.mapResponse(data: data)
            completion(.success(imagesModel))
        }
    }
}
