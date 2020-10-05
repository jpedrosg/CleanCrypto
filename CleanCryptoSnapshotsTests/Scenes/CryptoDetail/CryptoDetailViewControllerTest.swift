//
//  CryptoDetailViewControllerTest.swift
//  CleanCryptoSnapshotsTests
//
//  Created by João Pedro Giarrante on 04/10/20.
//  Copyright © 2020 Clean Swift LLC. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import CleanCrypto

class CryptoDetailViewControllerTest: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
//         recordMode = true
    }
    
    func testViewController(){
        
        tester().waitForAnimationsToFinish()
        
        // Search for CryptoButton
        if let cryptoButton = tester().waitForView(withAccessibilityIdentifier: "CryptoButton") as? UIButton {
            
            // Open CryptoDetailViewController
            tester().tapView(withAccessibilityIdentifier: cryptoButton.accessibilityIdentifier)
            
            // Validate first screen
            tester().waitForAnimationsToFinish()
            let imageViewFirstScreen = SnapshotsTestsHelper.getCurrentImageScreen()
            FBSnapshotVerifyView(imageViewFirstScreen, identifier: "first_screen", overallTolerance: 0.1)
            
        } else {
            XCTFail("CryptoButton not found")
        }
    }
}
