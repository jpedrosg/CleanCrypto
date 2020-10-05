//
//  CryptoPresenterMock.swift
//  CleanCryptoTests
//
//  Created by João Pedro Giarrante on 04/10/20.
//  Copyright © 2020 Clean Swift LLC. All rights reserved.
//

import Foundation
@testable import CleanCrypto

class CryptoPresenterMock: CryptoPresentationLogic {
    
    var presentFetchedCryptoCount = 0
    var presentCryptoErrorCount = 0
    var presentScreenLoadingCount = 0
    var hideScreenLoadingCount = 0
    var enableDetailButtonCount = 0
    var disableDetailButtonCount = 0
    
    func presentFetchedCrypto(response: CryptoModels.FetchCrypto.Response) {
        presentFetchedCryptoCount += 1
    }
    
    func presentCryptoError(error: Error) {
        presentCryptoErrorCount += 1
    }
    
    func presentScreenLoading() {
        presentScreenLoadingCount += 1
    }
    
    func hideScreenLoading() {
        hideScreenLoadingCount += 1
    }
    
    func enableDetailButton() {
        enableDetailButtonCount += 1
    }
    
    func disableDetailButton() {
        disableDetailButtonCount += 1
    }
}
