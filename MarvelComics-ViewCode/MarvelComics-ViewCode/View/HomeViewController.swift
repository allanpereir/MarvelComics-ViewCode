//
//  ViewController.swift
//  MarvelComics-ViewCode
//
//  Created by Alan Silva on 16/06/22.
//

import UIKit

class HomeViewController: UIViewController {

    var screen: HomeScreenView?
    
    override func loadView() {
        self.screen = HomeScreenView()
        self.screen?.setupTableViewProtocols(delegate: self, dataSource: self)
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CustomTableViewCell)
        return  cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

