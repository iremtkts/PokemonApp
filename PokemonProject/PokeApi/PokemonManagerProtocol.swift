//
//  PokemonManagerProtocol.swift
//  PokemonProject
//
//  Created by iremt on 27.03.2024.
//

import Foundation

protocol PokemonManagerProtocol {
    func fetchPokemonList(complete: @escaping ((PokemonList?, String?) -> ()))
    func fetchPokemonDetail(by id: Int, complete: @escaping ((PokemonDetail?, String?) -> ()))
}
