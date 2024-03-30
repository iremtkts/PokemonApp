//
//  NetworkManager.swift
//  PokemonProject
//
//  Created by iremt on 27.03.2024.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func request<T: Codable>(type: T.Type, url: String, method: HttpMethods, completion: @escaping (Result<T, ErrorTypes>) -> Void) {
        let session = URLSession.shared
        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            
            let dataTask = session.dataTask(with: request) { data, response, error in
                if let _ = error {
                    completion(.failure(.generalError))
                } else if let data = data {
                    self.handleResponse(data: data, completion: completion)
                } else {
                    completion(.failure(.invalidURL))
                }
            }
            dataTask.resume()
        } else {
            completion(.failure(.invalidURL)) 
        }
    }
    
    private func handleResponse<T: Codable>(data: Data, completion: @escaping (Result<T, ErrorTypes>) -> Void) {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(.invalidData))
        }
    }
}
