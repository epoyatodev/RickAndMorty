//
//  Networker.swift
//  RickAndMorty
//
//  Created by enrique.poyato on 17/11/23.
//

import Foundation
import Combine

protocol NetworkerProtocol: AnyObject {
    func callServer<T>(type: T.Type, request: URLRequest) -> AnyPublisher<T, Error> where T: Decodable
}

class Networker: NetworkerProtocol {
    func callServer<T>(type: T.Type, request: URLRequest) -> AnyPublisher<T, Error> where T : Decodable {
        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                return $0.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
