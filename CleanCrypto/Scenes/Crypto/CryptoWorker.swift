//
//  CryptoWorker.swift
//  CleanStore
//
//  Created by João Pedro Giarrante on 28/09/20.
//  Copyright © 2020 Clean Swift LLC. All rights reserved.
//

import Foundation
import PromiseKit

protocol CryptoNetworkLogic {
    func fetchCrypto(ticket: String, currency: String) -> Promise<CryptoModels.FetchCrypto.Response>
}

class CryptoWorker: CryptoNetworkLogic {
    
    let networkProvider = NetworkProvider.shared
    
    func fetchCrypto(ticket: String, currency: String) -> Promise<CryptoModels.FetchCrypto.Response>  {
        let requestProvider: CryptoProvider =  CryptoProvider(ticket: ticket, currency: currency)
        return networkProvider.request(requestProvider, parseAs: CryptoModels.FetchCrypto.Response.self)
    }
}

