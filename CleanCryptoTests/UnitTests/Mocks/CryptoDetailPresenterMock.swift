//
//  CryptoDetailPresenterMock.swift
//  CleanCryptoTests
//
//  Created by João Pedro Giarrante on 05/10/20.
//  Copyright © 2020 Clean Swift LLC. All rights reserved.
//

import Foundation
@testable import CleanCrypto

class CryptoDetailPresenterMock: CryptoDetailPresentationLogic {
    
    var presentCryptoDataCount = 0
    var presentErrorCount = 0
    
    func presentCryptoData(response: CryptoModels.FetchCrypto.Response) {
        presentCryptoDataCount += 1
    }
    
    func presentError() {
        presentErrorCount += 1
    }
}
