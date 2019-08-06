//
//  URL+extension.swift
//  URL+extension
//
//  Created by Frank van Boheemen on 06/08/2019.
//  Copyright © 2019 Frank van Boheemen. All rights reserved.
//

import Foundation

extension URL {
    static func buildURL(scheme: String, host: String, queryItems: [String : String]) -> URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.queryItems = []
        for item in queryItems {
            components.queryItems?.append(URLQueryItem(name: item.key, value: item.value))
        }
        return components.url
    }
    
    static func getQueryItems(from url: URL) -> [String : String] {
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)

        var queryItems = [String: String]()
        if let retreivedQueryItems = components?.queryItems {
            for item in retreivedQueryItems {
                if let value = item.value {
                    queryItems[item.name] = value
                }
            }
        }
        return queryItems
    }
}
