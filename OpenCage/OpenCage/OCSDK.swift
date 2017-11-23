//
//  OCSDK.swift
//  OpenCage
//
//  Created by Emu on 21/11/2017.
//  Copyright © 2017 OpenCage. All rights reserved.
//

import UIKit

/**
 Open Cage SDK Public Interface.
 */
class OCSDK: NSObject {
    
    private var apiKeyString :String = ""
    
    /**
     Convenience Initialiser
     
     - Parameter apiKey: Your API Key as provided from the OpenCage Website. This is required.
     */
    init(apiKey: String) {
        apiKeyString = apiKey
    }
    
    /**
     A function that provides a wrapper for the OpenCage Reverse Geocoding API.
     
     - Parameter latitude: An NSNumber. The latitude of the location. This is required
     - Parameter longitude: An NSNumber. The longitude of the location. This is required
     - Parameter withAnnotations: A Bool sent as to whether you want annotations returned as well. This is required
     - Parameter completionBlock: A block which returns the response from the API. This is required.
     */
    public func reverseGeocode(latitude :NSNumber, longitude :NSNumber, withAnnotations :Bool, completionBlock :@escaping ReverseGeocoderCompletionBlock) {
        OCNetworking.sharedInstance.reverseGeocode(latitude: latitude, longitude: longitude, withAnnotations: withAnnotations, apiKey: apiKeyString, completionBlock: completionBlock)
    }
    
    public func forwardGeocode(address :String, withAnnotations :Bool, completionBlock :@escaping ForwardGeocoderCompletionBlock) {
        OCNetworking.sharedInstance.forwardGeocode(address: address, withAnnotations: withAnnotations, apiKey: apiKeyString, completionBlock: completionBlock)
    }
}
