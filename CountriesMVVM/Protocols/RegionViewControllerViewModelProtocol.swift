//
//  RegionViewControllerProtocol.swift
//  CountriesMVVM
//
//  Created by Denis Velikanov on 17.03.2021.
//

import Foundation

protocol RegionViewControllerViewModelProtocol {
    var currentArray: [JSONModel] { get }
    
    func numberOfSections() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CollectionViewCellProcotol?

    func viewModelForSelectedItem() -> CountryViewControllerViewModelProtocol?
    func selectItem(atIndexPath indexPath: IndexPath)
    
    var imageName: String { set get }
    
    var changedValue: Box<String?> { get }
    
}
