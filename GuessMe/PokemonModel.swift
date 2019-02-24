//
//  PokemonModel.swift
//  GuessMe
//
//  Created by pleng on 24/2/2562 BE.
//  Copyright © 2562 pleng. All rights reserved.
//

import Foundation


class PokemonModel: Codable{
    var name: String?
    var sprites:PokemonSpriteModel?
}

class PokemonSpriteModel:Codable{
    var front_default: String?
}


