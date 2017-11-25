//
//  OpenCageTests.swift
//  OpenCageTests
//
//  Created by Emu on 21/11/2017.
//  Copyright © 2017 OpenCage. All rights reserved.
//

import XCTest
@testable import OpenCage

class OpenCageTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testReverseGeocoderFree() {
        let expectation = self.expectation(description: "fetch reverse geocode")
        
        let ocSDK :OCSDK = OCSDK(apiKey: "8d1f8b2d151b48358af5976447717687")
        ocSDK.reverseGeocode(latitude: NSNumber(value: 51.5159), longitude: NSNumber(value: 0.1297), withAnnotations: true) { (response, success, error) in
            if success {
                if response.remainingLimit != nil { // Only Free Accounts have the rate limit
                    XCTAssert(true, "Pass")
                    expectation.fulfill()
                }
            }
        }
        
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func testForwardGeocoderFree() {
        
    }

    func testForwardGeocoderPaid() {
        
    }
    
    func testRevereGeocoderPaid() {
        let expectation = self.expectation(description: "fetch reverse geocode paid")
        
        let ocSDK :OCSDK = OCSDK(apiKey: "cce72e47b0e14a8abcdf9d80f419d13b")
        ocSDK.reverseGeocode(latitude: NSNumber(value: 51.5159), longitude: NSNumber(value: 0.1297), withAnnotations: true) { (response, success, error) in
            if success {
                if response.remainingLimit != nil { // Only Free Accounts have the rate limit
                    XCTAssert(true, "Pass")
                    expectation.fulfill()
                }
            }
        }
        
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func testGeocoderErrors() {
        
    }
    
    func testMultiThreading() {
        
    }
}
