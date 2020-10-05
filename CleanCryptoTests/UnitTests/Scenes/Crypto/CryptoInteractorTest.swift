//
//  CryptoInteractorTest.swift
//  CleanCryptoTests
//
//  Created by João Pedro Giarrante on 04/10/20.
//  Copyright © 2020 Clean Swift LLC. All rights reserved.
//

import XCTest
import Quick
import Nimble
import PromiseKit
@testable import CleanCrypto


class CryptoInteractorTest: QuickSpec {

    override func spec() {
        super.spec()
        
        describe("CryptoInteractorTest") {
            var sut: CryptoInteractor!
            var mockWorker: CryptoWorkerMock!
            var mockPresenter: CryptoPresenterMock!
            let mockRequest = CryptoModels.FetchCrypto.Request.init(ticket: "BTC", currency: "USD")
            
            beforeEach{
                PromiseKit.conf.Q.map = nil
                PromiseKit.conf.Q.return = nil
                
                mockWorker = CryptoWorkerMock()
                mockPresenter = CryptoPresenterMock()
                
                sut = CryptoInteractor(cryptoWorker: mockWorker)
                sut.presenter = mockPresenter
            }
            
            describe("a request to fetch crypto and populate screen") {
                
                context("crypto request sucess and show crypto data") {
                    
                    it("returns the data from the crypto") {
                        mockWorker.resultType = .success
                        sut.fetchCrypto(request: mockRequest)
                        
                        expect(sut.crypto).toNot(beNil())
                        expect(sut.crypto?.assetIdBase).to(contain(mockRequest.ticket))
                        expect(sut.crypto?.assetIdQuote).to(contain(mockRequest.currency))
                        expect(mockPresenter.presentScreenLoadingCount).to(equal(1))
                        expect(mockPresenter.presentFetchedCryptoCount).to(equal(1))
                        expect(mockPresenter.hideScreenLoadingCount).to(equal(1))
                        expect(mockPresenter.enableDetailButtonCount).to(equal(1))
                        expect(mockPresenter.disableDetailButtonCount).to(equal(1))
                    }
                    
                    it("successful fetch more than one crypto data return") {
                        mockWorker.resultType = .success
                        sut.fetchCrypto(request: mockRequest)
                        
                        expect(sut.crypto).toNot(beNil())
                        expect(sut.crypto?.assetIdBase).to(contain(mockRequest.ticket))
                        expect(sut.crypto?.assetIdQuote).to(contain(mockRequest.currency))
                        expect(mockPresenter.presentScreenLoadingCount).to(equal(1))
                        expect(mockPresenter.hideScreenLoadingCount).to(equal(1))
                        expect(mockPresenter.presentFetchedCryptoCount).to(equal(1))
                        expect(mockPresenter.presentCryptoErrorCount).to(equal(0))
                        expect(mockPresenter.enableDetailButtonCount).to(equal(1))
                        expect(mockPresenter.disableDetailButtonCount).to(equal(1))
                        
                        sut.fetchCrypto(request: mockRequest)
                        
                        expect(sut.crypto).toNot(beNil())
                        expect(sut.crypto?.assetIdBase).to(contain(mockRequest.ticket))
                        expect(sut.crypto?.assetIdQuote).to(contain(mockRequest.currency))
                        expect(mockPresenter.presentScreenLoadingCount).to(equal(2))
                        expect(mockPresenter.hideScreenLoadingCount).to(equal(2))
                        expect(mockPresenter.presentFetchedCryptoCount).to(equal(2))
                        expect(mockPresenter.presentCryptoErrorCount).to(equal(0))
                        expect(mockPresenter.enableDetailButtonCount).to(equal(2))
                        expect(mockPresenter.disableDetailButtonCount).to(equal(2))
                    }
                }
                
                context("crypto request error and show error message") {
                    
                    it("returns error") {
                        mockWorker.resultType = .error
                        sut.fetchCrypto(request: mockRequest)
                        
                        expect(sut.crypto).to(beNil())
                        expect(mockPresenter.presentScreenLoadingCount).to(equal(1))
                        expect(mockPresenter.hideScreenLoadingCount).to(equal(1))
                        expect(mockPresenter.presentFetchedCryptoCount).to(equal(0))
                        expect(mockPresenter.presentCryptoErrorCount).to(equal(1))
                        expect(mockPresenter.enableDetailButtonCount).to(equal(0))
                        expect(mockPresenter.disableDetailButtonCount).to(equal(1))
                    }
                }
            }
            
            afterEach {
                sut = nil
                mockWorker = nil
                mockPresenter = nil
            }
        }
    }
}
