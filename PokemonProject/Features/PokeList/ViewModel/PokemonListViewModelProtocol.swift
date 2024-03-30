//
//  PokemonListViewModelProtocol.swift
//  PokemonProject
//
//  Created by iremt on 27.03.2024.
//

import Foundation


protocol PokemonListViewModelProtocol {
    var pokemonList: [Pokemon] { get }
    func fetchPokemonList()
    func fetchPokemonDetail(at index: Int, completion: @escaping (Result<PokemonDetail, Error>) -> Void)
}
