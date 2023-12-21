//
//  RMCharactersInteractor.swift
//  RickAndMorty
//
//  Created by enrique.poyato on 17/11/23.
//

import Foundation
import Combine

protocol RMCharactersInteractorProtocol: AnyObject {
    func getAllCharacters(filter: String, page: Int, status: String?, species: String?) -> AnyPublisher<RMCharacterResponse, Error>
    func getEpisode(id: [String]) -> AnyPublisher<[RMEpisodeModel], Error>
    func getLocation(id: String) -> AnyPublisher<RMLocationModel, Error>

}

final class RMCharactersInteractor: RMCharactersInteractorProtocol {
    

    let networker: NetworkerProtocol
    let baseNetwork: BaseNetwork
    
    init(networker: NetworkerProtocol = Networker(), baseNetwork: BaseNetwork = BaseNetwork()) {
        self.networker = networker
        self.baseNetwork = baseNetwork
    }
    
    func getAllCharacters(filter: String, page: Int, status: String?, species: String?) -> AnyPublisher<RMCharacterResponse, Error> {
        return networker.callServer(type: RMCharacterResponse.self, request: baseNetwork.getSessionCharacters(filter: filter, page: page, status: status,species: species)!)
    }
    
    func getEpisode(id: [String]) -> AnyPublisher<[RMEpisodeModel], Error> {
        return networker.callServer(type: [RMEpisodeModel].self, request: baseNetwork.getSessionEpisodes(id: id)!)
    }
    
    func getLocation(id: String) -> AnyPublisher<RMLocationModel, Error> {
        return networker.callServer(type: RMLocationModel.self, request: baseNetwork.getSessionLocation(id: id)!)
    }
    
    
}
