//
//  RegionViewController.swift
//  CountriesMVVM
//
//  Created by Denis Velikanov on 17.03.2021.
//

import Foundation

class RegionViewControllerViewModel: RegionViewControllerViewModelProtocol {
    
    private var selectedIndexPath: IndexPath?
    
    var temporaryArray: [JSONModel]?
    var currentArray: [JSONModel]
    var imageName: String
      
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
    
    func upButtonTapped() -> [JSONModel] {
        temporaryArray = currentArray
        let upArray = temporaryArray?.sorted(by: { (i, y) -> Bool in
            i.population > y.population
        })
        return upArray ?? [JSONModel(name: "no data", capital: "no data", subregion: "no data", population: 0, area: 0, flag: "no data", region: "no data")]
    }
    
    func downButtonTapped() -> [JSONModel] {
        temporaryArray = currentArray
        let downArray = temporaryArray?.sorted(by: { (i, y) -> Bool in
            i.name < y.name
        })
        return downArray ?? [JSONModel(name: "no data", capital: "no data", subregion: "no data", population: 0, area: 0, flag: "no data", region: "no data")]
    }
        
    var changedValue: Box<String?> = Box(nil)
    
    init(currentArray: [JSONModel], imageName: String) {
        self.currentArray = currentArray
        self.imageName = imageName
    }
}
