//
//  ViewControllerViewModelProtocol.swift
//  CountriesMVVM
//
//  Created by Denis Velikanov on 17.03.2021.
//

import Foundation

protocol ViewControllerViewModelProtocol {
    var europeArray: [JSONModel]? { set get }
    var africaArray: [JSONModel]? { set get }
    var asiaArray: [JSONModel]? { set get }
    var americaArray: [JSONModel]? { set get }
    
    func viewModelEurope() -> RegionViewControllerViewModelProtocol?
    func viewModelAmerica() -> RegionViewControllerViewModelProtocol?
    func viewModelAsia() -> RegionViewControllerViewModelProtocol?
    func viewModelAfrica() -> RegionViewControllerViewModelProtocol?

}
