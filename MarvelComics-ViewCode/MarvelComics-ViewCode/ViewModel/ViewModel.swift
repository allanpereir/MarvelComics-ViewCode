//
//  Controller.swift
//  MarvelComics-ViewCode
//
//  Created by Alan Silva on 16/06/22.
//

import Foundation

class ViewModel {
    
    var arrayCharacter: [Character] = []
    
    let netWorkManager: NetWorkManager = NetWorkManager()
    
    func getData(name: String?, completion: @escaping (Bool, Error?) -> Void) {
        netWorkManager.getData(name: name) { result, error in
            self.arrayCharacter = result ?? []
            completion(true, nil)
        }
    }
    
    var count: Int {
        return arrayCharacter.count
    }
    
    func getCharacter(indexPath: IndexPath) -> Character {
        return arrayCharacter[indexPath.row]
    }
    
    
}
