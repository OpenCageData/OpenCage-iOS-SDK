//
//  OCLocationResponse.swift
//  OpenCage
//
//  Created by Emu on 23/11/2017.
//  Copyright © 2017 OpenCage. All rights reserved.
//

import UIKit

class OCLocationResponse: NSObject {
    var ocLocation :[OCLocation] = []
    
    func setupWithData(dictionary :NSDictionary) {
        if let array :NSArray = dictionary.object(forKey: "results") as? NSArray {
            for object in array {
                let dict = object as! NSDictionary
                let location = OCLocation()
                location.setupWithData(dictionary: dict)
                ocLocation.append(location)
            }
        }
    }
}
