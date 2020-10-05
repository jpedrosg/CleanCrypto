//
//  Encodable.swift
//  CleanCrypto
//
//  Created by João Pedro Giarrante on 05/10/20.
//  Copyright © 2020 Clean Swift LLC. All rights reserved.
//

import Foundation

extension Encodable {
    func toData() -> Data? {
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(self)
            return jsonData
        }
        catch {
            return nil
        }
    }
}
