//
//  CryptoWorkerMock.swift
//  CleanCryptoTests
//
//  Created by João Pedro Giarrante on 04/10/20.
//  Copyright © 2020 Clean Swift LLC. All rights reserved.
//

import Foundation
import PromiseKit
@testable import CleanCrypto

enum ResultType {
    case error
    case success
    case empty
}

class CryptoWorkerMock: CryptoNetworkLogic {
    
    var resultType: ResultType = .success
    
    func fetchCrypto(ticket: String, currency: String) -> Promise<CryptoModels.FetchCrypto.Response> {
        switch resultType {
        case .success:
            let helper = JSONReaderHelper()
            if let response: CryptoModels.FetchCrypto.Response = helper.read(filename: "crypto-response-btc-usd") {
                return Promise { seal in seal.fulfill(response) }
            }
        case .error:
            return Promise { seal in seal.reject(NetworkError.notFound) }
        default:
            return Promise { seal in seal.reject(NetworkError.mappingError) }
        }
        return Promise { seal in seal.reject(NetworkError.mappingError) }
    }
}
