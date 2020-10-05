//
//  SnapshotsTestsHelper.swift
//  CleanCryptoSnapshotsTests
//
//  Created by João Pedro Giarrante on 04/10/20.
//  Copyright © 2020 Clean Swift LLC. All rights reserved.
//

import UIKit
import XCTest

class SnapshotsTestsHelper {
    static func getCurrentImageScreen() -> UIImageView {
        let image = XCUIScreen.main.screenshot().image
        let imageView = UIImageView(image: image.removeStatusBar())
        return imageView
    }
}
