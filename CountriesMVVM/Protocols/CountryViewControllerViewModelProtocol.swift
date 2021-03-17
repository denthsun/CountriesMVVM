//
//  CountryViewControllerViewModelProtocol.swift
//  CountriesMVVM
//
//  Created by Denis Velikanov on 17.03.2021.
//

import Foundation

protocol CountryViewControllerViewModelProtocol {
    var name: String { get }
    var capital: String { get }
    var population: Int { get }
    var subregion: String { get }
}
