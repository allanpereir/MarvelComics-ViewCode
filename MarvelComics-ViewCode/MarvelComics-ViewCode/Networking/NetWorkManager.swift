//
//  Service.swift
//  MarvelComics-ViewCode
//
//  Created by Alan Silva on 16/06/22.
//

import Foundation
import CryptoKit
import Alamofire

class NetWorkManager {
    
    var arrayCharacter: [Character] = []
    private let ts = String(Date().timeIntervalSince1970)
    
    func getData(name: String?, completion: @escaping ([Character]?, Error?) -> Void) {
        
        var url: String = ""
        let hash = self.MD5(data: "\(ts)\(MarvelAPI.priveteKey)\(MarvelAPI.publicKey)")
        
        if name == nil || name == "" {
            url = "\(MarvelAPI.urlAll)\(ts)&apikey=\(MarvelAPI.publicKey)&hash=\(hash)"
        }else {
            let nameCharacter: String = name!
            url =  "\(MarvelAPI.urlCharacter)\(nameCharacter)&ts=\(ts)&apikey=\(MarvelAPI.publicKey)&hash=\(hash)"
        }

        AF
            .request(url)
            .responseJSON { response in
            if let data = response.data {
                do {
                    let result: APIResult = try JSONDecoder().decode(APIResult.self, from: data)
                    //self.arrayCharacter = result.data.results
                    completion(result.data.results, nil)
                } catch  {
                    print(error.localizedDescription)
                    completion(nil, nil)
                }
            }
        }
    }

    func MD5(data: String) -> String {
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        return hash.map{
            String(format: "%002hx", $0)
        }
        .joined()
    }
}
