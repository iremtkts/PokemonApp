//
//  Pokemon.swift
//  PokemonProject
//
//  Created by iremt on 27.03.2024.
//

import Foundation

struct Pokemon: Codable {
    var id: Int {
        return url.components(separatedBy: "/").compactMap { Int($0) }.last ?? 0
    }
    let name: String
    let url: String

}

struct PokemonList: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Pokemon]
}

struct PokemonDetail: Codable {
    let abilities: [AbilityInfo]
    let sprites: Sprites
    
}

struct AbilityInfo: Codable {
    let ability: Ability

}

struct Ability: Codable {
    let name: String
    let url: String
}

struct Sprites: Codable {
    let front_default: String?
}


