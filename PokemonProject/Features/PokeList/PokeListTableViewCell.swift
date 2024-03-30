//
//  PokeListTableViewCell.swift
//  PokemonProject
//
//  Created by iremt on 27.03.2024.
//


import UIKit


class PokemonTableViewCell: UITableViewCell {
    static let identifier = "PokemonTableViewCell"
    

    private let pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   
    func configure(with pokemon: Pokemon) {
        nameLabel.text = pokemon.name
        let imageUrl = NetworkHelper.shared.getImageURL(forID: pokemon.id)
        pokemonImageView.loadImage(from: imageUrl)
    }
  
    private func setupLayout() {
        addSubview(pokemonImageView)
        addSubview(nameLabel)
        
        
        NSLayoutConstraint.activate([
            pokemonImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            pokemonImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 80),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 80),
            
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: pokemonImageView.trailingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
