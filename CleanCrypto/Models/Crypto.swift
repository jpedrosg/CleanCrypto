//
//  Crypto.swift
//  CleanStore
//
//  Created by João Pedro Giarrante on 28/09/20.
//  Copyright © 2020 Clean Swift LLC. All rights reserved.
//

import Foundation

// MARK: - Crypto
struct Crypto: Codable {
    var time, assetIDBase, assetIDQuote: String?
    var rate: Double?

    enum CodingKeys: String, CodingKey {
        case time
        case assetIDBase = "asset_id_base"
        case assetIDQuote = "asset_id_quote"
        case rate
    }
}
