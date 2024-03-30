//
//  ImageLoader.swift
//  PokemonProject
//
//  Created by iremt on 27.03.2024.
//
import UIKit


extension UIImageView {
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Geçersiz URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                print("Resim yüklenemedi: \(urlString) Hata: \(error?.localizedDescription ?? "Bilinmeyen hata")")
                return
            }
            DispatchQueue.main.async {
                self?.image = image
            }
        }
        task.resume()
    }
}

