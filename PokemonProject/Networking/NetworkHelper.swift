//
//  NetworkHelper.swift
//  PokemonProject
//
//  Created by iremt on 27.03.2024.
//

import Foundation

enum HttpMethods: String {
    case get = "GET"

}

enum ErrorTypes: String, Error {
    case invalidData = "Invalid data"
    case invalidURL = "Invalid URL"
    case generalError = "An error happened"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    let baseURL = "https://pokeapi.co/api/v2/pokemon"
    
    func getListURL(withLimit limit: Int) -> String {
        return "\(baseURL)?limit=\(limit)"
    }
    
    func getDetailURL(forID id: Int) -> String {
        return "\(baseURL)/\(id)"
    }
    
    func getImageURL(forID id: Int) -> String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
    }
}
