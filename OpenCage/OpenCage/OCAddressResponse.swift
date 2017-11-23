//
//  OCAddressResponse.swift
//  OpenCage
//
//  Created by Emu on 23/11/2017.
//  Copyright © 2017 OpenCage. All rights reserved.
//

import UIKit

class OCAddressResponse: NSObject {
    var ocAddress :[OCAddress] = []
    var licenses :NSArray = NSArray()
    var timestamp :NSDictionary = NSDictionary()
    var stayInformed :NSDictionary = NSDictionary()
    var totalResults :Int = 0
    var documentation :String = ""
    var thanksString :String = ""
    
    var remainingLimit :Int?
    
    func setupWithData(dictionary :NSDictionary) {
        if let array :NSArray = dictionary.object(forKey: "results") as? NSArray {
            for object in array {
                let dict = object as! NSDictionary
                let address = OCAddress()
                address.setupWithData(dictionary: dict)
                ocAddress.append(address)
            }
        }
        
        if let timestampDict :NSDictionary = dictionary.object(forKey: "timestamp") as? NSDictionary {
            timestamp = timestampDict
        }
        
        if let licensesArray :NSArray = dictionary.object(forKey: "licenses") as? NSArray {
            licenses = licensesArray
        }
        
        if let stayInformedDict :NSDictionary = dictionary.object(forKey: "stay_informed") as? NSDictionary {
            stayInformed = stayInformedDict
        }
        
        if let documentationString :String = dictionary.object(forKey: "documentation") as? String {
            documentation = documentationString
        }
        
        if let thanks :String = dictionary.object(forKey: "thanks") as? String {
            thanksString = thanks
        }
        
        if let totalCount :Int = dictionary.object(forKey: "total_results") as? Int {
            totalResults = totalCount
        }
        
        if let rate :NSDictionary = dictionary.object(forKey: "rate") as? NSDictionary {
            let remaining :Int = rate.object(forKey: "remaining") as! Int
            remainingLimit = remaining
        }
    }
}
