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
        let url = URLBuilder.buildURL(scheme: "locationApp", host: "place", queryItems: ["lattitude" : "\(lattitude)", "longitude": "\(longitude)"])
        
        if let url = url {
            let items = URLBuilder.getQueryItems(from: url)
            
            if let stringValue = items["lattitude"],
                let retreivedLattitude = Double(stringValue){
                XCTAssert(lattitude == retreivedLattitude)
            }
            
            if let stringValue = items["longitude"],
                let retreivedLongitude = Double(stringValue){
                XCTAssert(longitude == retreivedLongitude)
            }
        }
    }

}
