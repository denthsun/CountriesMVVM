//
//  RegionViewController.swift
//  CountriesMVVM
//
//  Created by Denis Velikanov on 17.03.2021.
//

import Foundation

class RegionViewControllerViewModel: RegionViewControllerViewModelProtocol {

    private var selectedIndexPath: IndexPath?
    
    var currentArray: [JSONModel]
      
    func numberOfSections() -> Int {
        return currentArray.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CollectionViewCellProcotol? {
        let country = currentArray[indexPath.row]
        
        return CollectionViewCellViewModel(country: country)
    }
    
    func viewModelForSelectedItem() -> CountryViewControllerViewModelProtocol? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return CountryViewControllerViewModel(country: currentArray[selectedIndexPath.row])
    }
    
    func selectItem(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    
    init(currentArray: [JSONModel]) {
        self.currentArray = currentArray
    }
    
}
