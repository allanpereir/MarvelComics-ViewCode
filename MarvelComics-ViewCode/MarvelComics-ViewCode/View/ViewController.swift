//
//  ViewController.swift
//  MarvelComics-ViewCode
//
//  Created by Alan Silva on 16/06/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var screen: HomeScreenView?
    
    override func loadView() {
        self.screen = HomeScreenView()
        self.view = screen
    }
}

