//
//  RMCharacterResponse.swift
//  RickAndMorty
//
//  Created by enrique.poyato on 17/11/23.
//

import Foundation

struct RMCharacterResponse: Codable {
    let info: Info
    let results: [RMCharacterModel]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
