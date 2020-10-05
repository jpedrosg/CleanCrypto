//
//  CryptoProvider.swift
//  CleanCrypto
//
//  Created by João Pedro Giarrante on 04/10/20.
//  Copyright © 2020 Clean Swift LLC. All rights reserved.
//

import Foundation

enum CoinApi: String {
    case apiKey = "CD098C13-4B4A-4B2A-A431-3767EC05DC72"
    
}

class CryptoProvider: RequestProviderProtocol {
    var path: String
    var queryItems: [URLQueryItem]
    
    init(ticket: String, currency: String) {
        
        path = "/v1/exchangerate/\(ticket)/\(currency)"
        queryItems = [
            URLQueryItem(name: "apikey", value: CoinApi.apiKey.rawValue),
           ]
    }

}
