//
//  OCGeoResponse.swift
//  OpenCage
//
//  Created by Emu on 26/11/2017.
//  Copyright © 2017 OpenCage. All rights reserved.
//

import UIKit

public class OCGeoResponse: NSObject {
    public var locations :[OCGeoObject] = []
    public var licenses :NSArray = NSArray()
    public var timestamp :NSDictionary = NSDictionary()
    public var stayInformed :NSDictionary = NSDictionary()
    public var totalResults :Int = 0
    public var documentation :String = ""
    public var thanksString :String = ""
    
    public var remainingLimit :Int?

    func setupWithData(dictionary :NSDictionary) {
        if let array :NSArray = dictionary.object(forKey: "results") as? NSArray {
            for object in array {
                let dict = object as! NSDictionary
                let location = OCGeoObject()
                location.setupWithData(dictionary: dict)
                locations.append(location)
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
