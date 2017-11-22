//
//  OCSDK.swift
//  OpenCage
//
//  Created by Emu on 21/11/2017.
//  Copyright © 2017 OpenCage. All rights reserved.
//

import UIKit

enum OpenCageError: Error {
    case invalidAPIKey
}

class OCSDK: NSObject {
    
    private var apiKeyString :String = ""
    
    init(apiKey: String) throws {
        if apiKey.count == 0 {
            print("[Open Cage SDK] Invalid API Key")
            throw OpenCageError.invalidAPIKey
        }
        
        apiKeyString = apiKey
    }
    
    public func reverseGeocode(latitude :NSNumber, longitude :NSNumber, withAnnotations :Bool, completionBlock :@escaping AsyncCompletionBlock) {
        
    }
    
    public func forwardGeocode(address :String, withAnnotations :Bool, completionBlock :@escaping AsyncCompletionBlock) {
        
    }
}
