//
//  RMCharactersViewModel.swift
//  RickAndMorty
//
//  Created by enrique.poyato on 17/11/23.
//

import Foundation
import Combine

final class RMCharactersViewModel: ObservableObject {
    @Published var status: Status = .loading
    @Published var characters: [RMCharacterModel] = []
    @Published var page = 1
    @Published var msgErrorFilter = ""
    @Published var rmEpisodes: [RMEpisodeModel] = []
    @Published var rmLocation: RMLocationModel?
    
    var totalPages = 0
    
    
    
    var subscriptor = Set<AnyCancellable>()
    var interactor: RMCharactersInteractorProtocol
    
    init(interactor: RMCharactersInteractorProtocol = RMCharactersInteractor()) {
        self.interactor = interactor
        fetchAllCharacters()
    }
    
    func fetchAllCharacters(filter: String = "", status: String = "", species: String = "") {
        interactor.getAllCharacters(filter: filter, page: self.page, status: status, species: species)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    if !filter.isEmpty {
                        self.msgErrorFilter = "No results for \(filter)"
                    } else {
                        self.status = .error(error: "Error fetching characters: \(error.localizedDescription)")
                    }
                case .finished:
                    self.msgErrorFilter = ""
                    self.status = .loaded
                    
                }
            } receiveValue: { data in
                self.totalPages = data.info.pages
                self.loadOrNotMorePages(data: data)
            }
            .store(in: &subscriptor)
        
    }
    
    func fetchEpisode(idEpisodes: [String]) {
        interactor.getEpisode(id: idEpisodes)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.status = .error(error: "Error fetching episodes: \(error.localizedDescription)")
                    
                case .finished:
                    self.status = .loaded
                    
                }
            } receiveValue: { data in
                self.rmEpisodes = data
            }
            .store(in: &subscriptor)
        
    }
    
    func fetchLocation(idLocation: String) {
        interactor.getLocation(id: idLocation)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.status = .error(error: "Error fetching location: \(error.localizedDescription)")
                    
                case .finished:
                    self.status = .loaded
                    
                }
            } receiveValue: { data in
                self.rmLocation = data
            }
            .store(in: &subscriptor)
    }
    
    
    
    func loadOrNotMorePages(data: RMCharacterResponse) {
        if self.page > 1  {
            self.characters.append(contentsOf: data.results)
        } else {
            self.characters = data.results
        }
    }
    
    func extractLastNumber(from arrayUrlString: [String]) -> [String] {
        var idEpisodes: [String] = []
        for array in arrayUrlString {
            let components = array.components(separatedBy: "/")
            if let lastComponent = components.last {
                idEpisodes.append(lastComponent)
            }
        }
        
        return idEpisodes
        
    }
    
    func extractLastNumber(urlString: String) -> String {
        let components = urlString.components(separatedBy: "/")
        if let lastComponent = components.last {
            return lastComponent
        } else {
            return "No data"
        }
    }
}

