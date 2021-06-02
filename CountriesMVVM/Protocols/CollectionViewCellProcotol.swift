//
//  CollectionViewCellProcotol.swift
//  CountriesMVVM
//
//  Created by Denis Velikanov on 17.03.2021.
//

import Foundation

protocol CollectionViewCellProcotol: class {
    var countryName: String { get }
    var capital: String { get }
    var population: Int { get }
}
