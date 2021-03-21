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
        guard let europeArray = europeArray else { return RegionViewControllerViewModel(currentArray: [JSONModel(name: "no data", capital: "no data", subregion: "no data", population: 0, flag: "no data", region: "no data")], imageName: "") }
        return RegionViewControllerViewModel(currentArray: europeArray , imageName: "https://image.freepik.com/free-vector/waving-europeans-flag-the-flag-of-europe_131573-58.jpg")
    }
    
    func viewModelAmerica() -> RegionViewControllerViewModelProtocol? {
        guard let americaArray = americaArray else { return RegionViewControllerViewModel(currentArray: [JSONModel(name: "no data", capital: "no data", subregion: "no data", population: 0, flag: "no data", region: "no data")], imageName: "") }
        return RegionViewControllerViewModel(currentArray: americaArray , imageName: "https://www.forumdaily.com/wp-content/uploads/2018/12/Depositphotos_40852629_m-2015.jpg")
    }
    
    func viewModelAsia() -> RegionViewControllerViewModelProtocol? {
        guard let asiaArray = asiaArray else { return RegionViewControllerViewModel(currentArray: [JSONModel(name: "no data", capital: "no data", subregion: "no data", population: 0, flag: "no data", region: "no data")], imageName: "") }
        
        return RegionViewControllerViewModel(currentArray: asiaArray , imageName: "https://lh3.googleusercontent.com/proxy/OB83lX48s1O1oqR8Ka_s8V1qZSz8VOS5pVGPInyGnXhWgSyQbh5-_PQy2GrUdbjfbfgVXnJRUWV8WhkI3w0mGHrM67YKjyrqUXsAdesGyG3hfRmZH0nk")
    }
    
    func viewModelAfrica() -> RegionViewControllerViewModelProtocol? {
        guard let africaArray = africaArray else { return RegionViewControllerViewModel(currentArray: [JSONModel(name: "no data", capital: "no data", subregion: "no data", population: 0, flag: "no data", region: "no data")], imageName: "") }
        
        return RegionViewControllerViewModel(currentArray: africaArray , imageName: "https://static.dw.com/image/15894995_303.jpg")
    }
    
    
    
}
