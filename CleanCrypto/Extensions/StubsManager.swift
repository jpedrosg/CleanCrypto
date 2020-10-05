//
//  StubsManager.swift
//  CleanCrypto
//
//  Created by João Pedro Giarrante on 05/10/20.
//  Copyright © 2020 Clean Swift LLC. All rights reserved.
//

import Foundation
import OHHTTPStubs

class StubManager {
    
    static let shared = StubManager()
    
    func stubRequests(withDelay delay: TimeInterval) {
        
        stub(condition: isHost("rest.coinapi.io") && containsQueryParams(["apikey": CoinApi.apiKey.rawValue])) { request -> HTTPStubsResponse in
            
            let result: CryptoModels.FetchCrypto.Response? = JSONReaderHelper().read(filename: "crypto-response-btc-usd")
            return HTTPStubsResponse(data: result.toData() ?? Data(), statusCode: 200, headers: nil).responseTime(delay)
        }
    }
    
}
