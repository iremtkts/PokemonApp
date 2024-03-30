//
//  PokemonManager.swift
//  PokemonProject
//
//  Created by iremt on 27.03.2024.
//

import Foundation


class PokemonManager: PokemonManagerProtocol {
    
    func fetchPokemonDetail(by id: Int, complete: @escaping ((PokemonDetail?, String?) -> ())) {
            let url = NetworkHelper.shared.getDetailURL(forID: id)
            NetworkManager.shared.request(type: PokemonDetail.self, url: url, method: .get) { response in
                switch response {
                case .success(let pokemonDetail):
                    complete(pokemonDetail, nil)
                case .failure(let error):
                    complete(nil, error.rawValue)
                }
            }
        }
    
  
    func fetchPokemonList(complete: @escaping ((PokemonList?, String?) -> ())) {
            let url = NetworkHelper.shared.getListURL(withLimit: 30)
            NetworkManager.shared.request(type: PokemonList.self, url: url, method: .get) { response in
            switch response {
            case .success(let pokemonList):
                complete(pokemonList, nil)
            case .failure(let error):
                complete(nil, error.rawValue)
            }
        }
    }

    
}
