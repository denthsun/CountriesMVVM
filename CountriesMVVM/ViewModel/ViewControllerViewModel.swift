//
//  ViewControllerViewModel.swift
//  CountriesMVVM
//
//  Created by Denis Velikanov on 17.03.2021.
//

import Foundation

class ViewControllerViewModel: ViewControllerViewModelProtocol {
    
    var europeArray: [JSONModel]?
    var africaArray: [JSONModel]?
    var asiaArray: [JSONModel]?
    var americaArray: [JSONModel]?
    

    func viewModelEurope() -> RegionViewControllerViewModelProtocol? {
        return RegionViewControllerViewModel(currentArray: europeArray ?? [JSONModel(name: "no data", capital: "no data", subregion: "no data", population: 1, area: 1, flag: "no data", region: "")])
    }
    
    func viewModelAmerica() -> RegionViewControllerViewModelProtocol? {
        return RegionViewControllerViewModel(currentArray: americaArray ?? [JSONModel(name: "no data", capital: "no data", subregion: "no data", population: 1, area: 1, flag: "no data", region: "")])
    }
    
    func viewModelAsia() -> RegionViewControllerViewModelProtocol? {
        return RegionViewControllerViewModel(currentArray: asiaArray ?? [JSONModel(name: "no data", capital: "no data", subregion: "no data", population: 1, area: 1, flag: "no data", region: "")])
    }
    
    func viewModelAfrica() -> RegionViewControllerViewModelProtocol? {
        return RegionViewControllerViewModel(currentArray: africaArray ?? [JSONModel(name: "no data", capital: "no data", subregion: "no data", population: 1, area: 1, flag: "no data", region: "")])
    }
    

    
}
