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
        return RegionViewControllerViewModel(currentArray: europeArray ?? [JSONModel(name: "no data", capital: "no data", subregion: "no data", population: 1, area: 1, flag: "no data", region: "")], imageName: "http://www.coe.int/documents/16695/61254353/news-5may.jpg/cbc66b66-c67f-06e5-3bc6-b21a77f05099")
    }
    
    func viewModelAmerica() -> RegionViewControllerViewModelProtocol? {
        return RegionViewControllerViewModel(currentArray: americaArray ?? [JSONModel(name: "no data", capital: "no data", subregion: "no data", population: 1, area: 1, flag: "no data", region: "")], imageName: "https://www.forumdaily.com/wp-content/uploads/2018/12/Depositphotos_40852629_m-2015.jpg")
    }
    
    func viewModelAsia() -> RegionViewControllerViewModelProtocol? {
        return RegionViewControllerViewModel(currentArray: asiaArray ?? [JSONModel(name: "no data", capital: "no data", subregion: "no data", population: 1, area: 1, flag: "no data", region: "")], imageName: "https://lh3.googleusercontent.com/proxy/OB83lX48s1O1oqR8Ka_s8V1qZSz8VOS5pVGPInyGnXhWgSyQbh5-_PQy2GrUdbjfbfgVXnJRUWV8WhkI3w0mGHrM67YKjyrqUXsAdesGyG3hfRmZH0nk")
    }
    
    func viewModelAfrica() -> RegionViewControllerViewModelProtocol? {
        return RegionViewControllerViewModel(currentArray: africaArray ?? [JSONModel(name: "no data", capital: "no data", subregion: "no data", population: 1, area: 1, flag: "no data", region: "")], imageName: "https://static.dw.com/image/15894995_303.jpg")
    }
    

    
}
