//
//  PokemonApiManager.swift
//  GuessMe
//
//  Created by pleng on 24/2/2562 BE.
//  Copyright © 2562 pleng. All rights reserved.
//

import Foundation
import Alamofire

class PokemonApiManager {
    let host = "https://pokeapi.co/api/v2/"
    //Completeion agument คือตัวเช็คว่าดึง Api มาเสร็จแล้วหรือยัง
    func getPokemonDetails(id: Int, completion:@escaping (PokemonModel)->()){
        let path = "pokemon/\(id)/"
        let fullPath = "\(host)\(path)"
        // Alamofire 4
        Alamofire.request(fullPath).responseJSON { (response) in
            let decoder = JSONDecoder()
            let pokemon = try! decoder.decode(PokemonModel.self, from: response.data!)
            completion(pokemon)
        }
        
    }
}
