//
//  Character.swift
//  MarvelComics-ViewCode
//
//  Created by Alan Silva on 16/06/22.
//

import Foundation

struct APIResult: Codable {
    var data: APICharacterData
}

struct APICharacterData: Codable {
    var count: Int
    var results: [Character]
}

struct Character: Codable {
    var id: Int
    let name: String
    let description: String
    let thumbnail: [String:String]
}
