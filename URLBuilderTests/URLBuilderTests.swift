//
//  URLBuilderTests.swift
//  URLBuilderTests
//
//  Created by Frank van Boheemen on 06/08/2019.
//  Copyright © 2019 Frank van Boheemen. All rights reserved.
//

import XCTest
@testable import URLBuilder

class URLBuilderTests: XCTestCase {

    func testRetreiveQueryItemsFromCustomURLScheme() {
        let lattitude = 52.3680
        let longitude = 4.9036
        let url = URL.buildURL(scheme: "locationApp", host: "place", queryItems: ["lattitude" : "\(lattitude)", "longitude": "\(longitude)"])
        
        if let url = url,
            let queryItems = URL.getQueryItems(from: url) {
            
            
            if let stringValue = queryItems["lattitude"],
                let retreivedLattitude = Double(stringValue){
                XCTAssert(lattitude == retreivedLattitude)
            }
            
            if let stringValue = queryItems["longitude"],
                let retreivedLongitude = Double(stringValue){
                XCTAssert(longitude == retreivedLongitude)
            }
        }
    }

}
