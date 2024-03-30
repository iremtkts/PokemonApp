import UIKit

class PokeListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView!
    var viewModel: PokemonListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViewModel()
    }

    private func setupTableView() {
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: "PokemonTableViewCell")
        
        tableView.rowHeight = 75
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

    private func setupViewModel() {
        viewModel = PokemonListViewModel(manager: PokemonManager())
        
        viewModel.onPokemonListFetched = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.fetchPokemonList()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemonList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell", for: indexPath) as! PokemonTableViewCell
        let pokemon = viewModel.pokemonList[indexPath.row]
        cell.configure(with: pokemon)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPokemon = viewModel.pokemonList[indexPath.row]
        viewModel.fetchPokemonDetail(at: indexPath.row) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let pokemonDetail):
                    let detailViewModel = PokemonDetailViewModel(pokemon: selectedPokemon, pokemonDetail: pokemonDetail)
                    let detailVC = PokemonDetailViewController(viewModel: detailViewModel)
                    self?.navigationController?.pushViewController(detailVC, animated: true)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }


}
