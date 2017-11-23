//
//  OCAddress.swift
//  OpenCage
//
//  Created by Emu on 23/11/2017.
//  Copyright © 2017 OpenCage. All rights reserved.
//

import UIKit

class OCAddress: NSObject {
    
    
    /*
    "bounds": {
        "northeast": {
            "lat": 51.5127636,
            "lng": 0.1311587
        },
        "southwest": {
            "lat": 51.512002,
            "lng": 0.1276985
        }
    },
    "components": {
        "ISO_3166-1_alpha-2": "GB",
        "_type": "road",
        "city": "London",
        "country": "United Kingdom",
        "country_code": "gb",
        "postcode": "SE28 8NZ",
        "road": "St Andrews Close",
        "state": "England",
        "state_district": "Greater London"
    },
    "confidence": 9,
    "formatted": "St Andrews Close, London SE28 8NZ, United Kingdom",
    "geometry": {
        "lat": 51.5125159,
        "lng": 0.1298424
    }
 */
    var annotations :[OCAnnotation] = []
    
    func setupWithData(dictionary :NSDictionary) {
        if let annotationsArray :NSArray = dictionary.object(forKey: "annotations") as? NSArray {
            for object in annotationsArray {
                let dict :NSDictionary = object as! NSDictionary
                let annotation :OCAnnotation = OCAnnotation()
                annotation.setupWithData(dictionary: dict)
                annotations.append(annotation)
            }
        }
    }
}
