//
//  ExtensionPreviews.swift
//  RickAndMorty
//
//  Created by enrique.poyato on 17/11/23.
//

import Foundation

extension RMCharacterModel {
    static let characterPreview = RMCharacterModel(id: 1, name: "Rick Sanchez", status: .alive, species: "Human", type: "", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", origin: Origin(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"), location: Origin(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), episode: ["https://rickandmortyapi.com/api/episode/1","https://rickandmortyapi.com/api/episode/2","https://rickandmortyapi.com/api/episode/3","https://rickandmortyapi.com/api/episode/4","https://rickandmortyapi.com/api/episode/5","https://rickandmortyapi.com/api/episode/6","https://rickandmortyapi.com/api/episode/7","https://rickandmortyapi.com/api/episode/8","https://rickandmortyapi.com/api/episode/9","https://rickandmortyapi.com/api/episode/10"])
    
}


extension RMLocationModel {
    static let locationPreview: RMLocationModel = .init(id: 1, name: "Earth", type: "Planet", dimension: "Dimension")
}

extension RMEpisodeModel {
    static let episodePreview: RMEpisodeModel = .init(id: 1, name: "Pilot", air_date: "December 2, 2013", episode: "S01E01", characters: ["https://rickandmortyapi.com/api/character/1","https://rickandmortyapi.com/api/character/2","https://rickandmortyapi.com/api/character/35"])
}
