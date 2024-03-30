//
//  PokeDetailView.swift
//  PokemonProject
//
//  Created by iremt on 27.03.2024.
//
import UIKit

class PokemonDetailView: UIView {
    
    let pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let abilitiesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .white
        
        addSubview(pokemonImageView)
        addSubview(nameLabel)
        addSubview(abilitiesLabel)
        
        NSLayoutConstraint.activate([
            pokemonImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            pokemonImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 200),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 200),
            
            nameLabel.topAnchor.constraint(equalTo: pokemonImageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            abilitiesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            abilitiesLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            abilitiesLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 20),
            abilitiesLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20)
        ])
    }
    
    func configure(with viewModel: PokemonDetailViewModel) {
        nameLabel.text = "Name: \(viewModel.name)"
        pokemonImageView.loadImage(from: viewModel.imageUrl)
        let abilities = viewModel.abilities.joined(separator: ", ")
        abilitiesLabel.text = "Abilities: \(abilities)"
    }

}
