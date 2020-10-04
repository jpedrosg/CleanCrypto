//
//  NetworkProviderProtocol.swift
//  CleanCrypto
//
//  Created by João Pedro Giarrante on 04/10/20.
//  Copyright © 2020 Clean Swift LLC. All rights reserved.
//

import Foundation

protocol RequestProviderProtocol {
    var path: String { get set }
    var queryItems: [URLQueryItem] { get set }
}

extension RequestProviderProtocol {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rest.coinapi.io"
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}

