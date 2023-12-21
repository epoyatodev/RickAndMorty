//
//  RMEpisodeModel.swift
//  RickAndMorty
//
//  Created by Enrique Poyato Ortiz on 18/11/23.
//

import Foundation

struct RMEpisodeModel: Codable, Identifiable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
}
