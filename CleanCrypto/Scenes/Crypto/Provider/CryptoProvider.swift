//
//  CryptoProvider.swift
//  CleanCrypto
//
//  Created by João Pedro Giarrante on 04/10/20.
//  Copyright © 2020 Clean Swift LLC. All rights reserved.
//

import Foundation

class CryptoProvider: RequestProviderProtocol {
    var path: String
    var queryItems: [URLQueryItem]
    
    init(ticket: String, currency: String) {
        
        path = "/v1/exchangerate/\(ticket)/\(currency)"
        queryItems = [
               URLQueryItem(name: "apikey", value: "5256247C-E5D3-4EAF-9678-8C01E87FB69C"),
           ]
    }

}
