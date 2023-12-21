//
//  RMLocationModel.swift
//  RickAndMorty
//
//  Created by Enrique Poyato Ortiz on 18/11/23.
//

import Foundation

struct RMLocationModel: Codable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
}
