//
//  CollectionViewCellViewModel.swift
//  CountriesMVVM
//
//  Created by Denis Velikanov on 17.03.2021.
//

import Foundation

class CollectionViewCellViewModel: CollectionViewCellProcotol {

    private var country: JSONModel
    
    var countryName: String {
        return country.name
    }
    
    var capital: String {
        return country.capital
    }
    
    var population: Int {
        return country.population
    }
 
    init(country: JSONModel) {
        self.country = country
    }
}
