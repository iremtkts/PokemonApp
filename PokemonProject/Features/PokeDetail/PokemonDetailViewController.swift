//
//  PokemonDetailViewController.swift
//  PokemonProject
//
//  Created by iremt on 27.03.2024.
//

import UIKit


class PokemonDetailViewController: UIViewController {
    private let pokemonDetailView = PokemonDetailView()
    private var viewModel: PokemonDetailViewModel!

  
    init(viewModel: PokemonDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = pokemonDetailView
        configureView()
    }
    
    private func configureView() {
        pokemonDetailView.configure(with: viewModel)
    }
}
