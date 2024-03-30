//
//  PokemonDetailViewModelProtocol.swift
//  PokemonProject
//
//  Created by iremt on 30.03.2024.
//

import Foundation

protocol PokemonDetailViewModelProtocol {
    var name: String { get }
    var abilities: [String] { get }
    var imageUrl: String { get }
    
}
