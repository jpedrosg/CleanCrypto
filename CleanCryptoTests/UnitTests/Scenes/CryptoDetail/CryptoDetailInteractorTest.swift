//
//  CryptoDetailInteractorTest.swift
//  CleanCryptoTests
//
//  Created by João Pedro Giarrante on 05/10/20.
//  Copyright © 2020 Clean Swift LLC. All rights reserved.
//

import XCTest
import Quick
import Nimble
import PromiseKit
@testable import CleanCrypto

class CryptoDetailInteractorTest: QuickSpec {

    override func spec() {
        super.spec()
        
        describe("CryptoDetailInteractorTest") {
            var sut: CryptoDetailInteractor!
            var mockDetailPresenter: CryptoDetailPresenterMock!
            let mockCrypto = CryptoModels.FetchCrypto.Response.init(time: "1.0", assetIdBase: "BRL", assetIdQuote: "LTC", rate: 200.0)
            
            beforeEach{
                PromiseKit.conf.Q.map = nil
                PromiseKit.conf.Q.return = nil
                
                mockDetailPresenter = CryptoDetailPresenterMock()
                
                sut = CryptoDetailInteractor()
                sut.presenter = mockDetailPresenter
            }
            
            describe("cryptoDetail is called with data and presents it") {
                
                context("data passed between datastores and it is correctly presented") {

                    it("successful recieve crypto data then present recieved crypto data") {
                        sut.crypto = mockCrypto
                        sut.getCryptoData()
                        
                        expect(mockDetailPresenter.presentCryptoDataCount).to(equal(1))
                        expect(mockDetailPresenter.presentErrorCount).to(equal(0))
                    }
                }
                
                context("cryptoDetail is called without data and present error") {
                    
                    it("recieve no data then presents error") {
                        sut.crypto = nil
                        sut.getCryptoData()
                        
                        expect(mockDetailPresenter.presentCryptoDataCount).to(equal(0))
                        expect(mockDetailPresenter.presentErrorCount).to(equal(1))
                    }
                }
            }
            
            afterEach {
                sut = nil
                mockDetailPresenter = nil
            }
        }
    }
    

}
