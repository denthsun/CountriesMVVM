//
//  JSONModel.swift
//  CountriesMVVM
//
//  Created by Denis Velikanov on 17.03.2021.
//

import Foundation

struct JSONModel: Decodable {
    var name: String
    var capital: String
    var subregion: String
    var population: Int
    var area: Float?
    var flag: String
    var region: String
}
