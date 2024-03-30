//
//  PokeDetailViewModel.swift
//  PokemonProject
//
//  Created by iremt on 30.03.2024.
//

import Foundation

class PokemonDetailViewModel {
    var pokemon: Pokemon?
    var pokemonDetail: PokemonDetail?
    
    init(pokemon: Pokemon?, pokemonDetail: PokemonDetail?) {
        self.pokemon = pokemon
        self.pokemonDetail = pokemonDetail
    }
    

    var name: String {
        return pokemon?.name ?? "Unknown"
    }
    
    var abilities: [String] {
        return pokemonDetail?.abilities.map { $0.ability.name } ?? []
    }
    
    var imageUrl: String {
        return pokemonDetail?.sprites.front_default ?? ""
    }

}
