//
//  ViewController.swift
//  MarvelComics-ViewCode
//
//  Created by Alan Silva on 16/06/22.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {

    var screen: HomeScreenView?
    let viewModel: ViewModel = ViewModel()
    
    override func loadView() {
        self.screen = HomeScreenView()
        self.screen?.setupTableViewProtocols(delegate: self, dataSource: self)
        self.screen?.setupSearchBarProtocol(delegate: self)
        self.view = screen
        viewModel.getData(name: nil) { bool, error in
            self.screen?.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CustomTableViewCell) as? CustomTableViewCell
        cell?.setup(value: (viewModel.getCharacter(indexPath: indexPath)))
        return  cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.getData(name: searchBar.text) { bool, error in
            self.screen?.tableView.reloadData()
        }
    }
}

