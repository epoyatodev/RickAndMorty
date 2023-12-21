//
//  RMCharacterModel.swift
//  RickAndMorty
//
//  Created by enrique.poyato on 17/11/23.
//

import Foundation

struct RMCharacterModel: Codable, Identifiable {
    let id: Int
    let name: String
    let status: RMStatus
    let species: String
    let type: String
    let gender: String
    let image: String
    let origin: Origin
    let location: Origin
    let episode: [String]
}


enum RMStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

struct Origin: Codable {
    let name: String
    let url: String
}
