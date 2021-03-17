//
//  BooksDataFetcher.swift
//  MVVM_Films2020
//
//  Created by Denis Velikanov on 08.03.2021.
//

import Foundation

class CountriesDataFetcher {
    
    var networkDataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.networkDataFetcher = dataFetcher
    }
    
    func europeRequest(completion: @escaping ([JSONModel]?) -> Void ) {
        let europeUrl = "https://restcountries.eu/rest/v2/region/europe"
        networkDataFetcher.fetchGenericJSONData(urlString: europeUrl, response: completion)
    }

    func americaRequest(completion: @escaping ([JSONModel]?) -> Void ) {
        let americaUrl = "https://restcountries.eu/rest/v2/region/americas"
        networkDataFetcher.fetchGenericJSONData(urlString: americaUrl, response: completion)
    }
    
    func africaRequest(completion: @escaping ([JSONModel]?) -> Void ) {
        let africaUrl = "https://restcountries.eu/rest/v2/region/africa"
        networkDataFetcher.fetchGenericJSONData(urlString: africaUrl, response: completion)
    }
    
    func asiaRequest(completion: @escaping ([JSONModel]?) -> Void ) {
        let asiaUrl = "https://restcountries.eu/rest/v2/region/asia"
        networkDataFetcher.fetchGenericJSONData(urlString: asiaUrl, response: completion)
    }


}
