//
//  OCSDK.swift
//  OpenCage
//
//  Created by Emu on 21/11/2017.
//  Copyright © 2017 OpenCage. All rights reserved.
//

import UIKit

class OCSDK: NSObject {
    
    private var apiKeyString :String = ""
    
    init(apiKey: String) {
        apiKeyString = apiKey
    }
    
    public func reverseGeocode(latitude :NSNumber, longitude :NSNumber, withAnnotations :Bool, completionBlock :@escaping ReverseGeocoderCompletionBlock) {
        OCNetworking.sharedInstance.reverseGeocode(latitude: latitude, longitude: longitude, withAnnotations: withAnnotations, apiKey: apiKeyString, completionBlock: completionBlock)
    }
    
    public func forwardGeocode(address :String, withAnnotations :Bool, completionBlock :@escaping ForwardGeocoderCompletionBlock) {
        OCNetworking.sharedInstance.forwardGeocode(address: address, withAnnotations: withAnnotations, apiKey: apiKeyString, completionBlock: completionBlock)
    }
}
