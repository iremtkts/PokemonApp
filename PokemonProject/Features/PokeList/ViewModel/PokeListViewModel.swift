//
//  PokeListViewModel.swift
//  PokemonProject
//
//  Created by iremt on 27.03.2024.
//

import Foundation

class PokemonListViewModel: PokemonListViewModelProtocol {
    
    private var manager: PokemonManagerProtocol
    var pokemonList: [Pokemon] = [] {
        didSet {
            self.onPokemonListFetched?()
        }
    }
    
    var onPokemonListFetched: (() -> Void)?

    init(manager: PokemonManagerProtocol = PokemonManager()) {
        self.manager = manager
    }

    func fetchPokemonList() {
        manager.fetchPokemonList { [weak self] (list, error) in
            DispatchQueue.main.async {
                if let list = list {
                    self?.pokemonList = list.results
                } else {
                    print("Error fetching pokemon list")
                }
            }
        }
    }
    func fetchPokemonDetail(at index: Int, completion: @escaping (Result<PokemonDetail, any Error>) -> Void) {
        let selectedPokemon = self.pokemonList[index]
        manager.fetchPokemonDetail(by: selectedPokemon.id) { pokemonDetail, error in
            DispatchQueue.main.async {
                if let pokemonDetail = pokemonDetail {
                    completion(.success(pokemonDetail))
                } else if error != nil {
                    completion(.failure(ErrorTypes.generalError))
                }
            }
        }
    }
}

