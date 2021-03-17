//
//  CountryViewControllerViewModel.swift
//  CountriesMVVM
//
//  Created by Denis Velikanov on 17.03.2021.
//

import Foundation

class CountryViewControllerViewModel: CountryViewControllerViewModelProtocol {
    
    private var country: JSONModel
    
    var name: String {
        return country.name
    }
    
    var capital: String {
        return country.capital
    }
    
    var population: Int {
        return country.population
    }
    
    var subregion: String {
        return country.subregion
    }
    
    init(country: JSONModel) {
        self.country = country
    }
}
