//
//  OCGeoObject.swift
//  OpenCage
//
//  Created by Emu on 26/11/2017.
//  Copyright © 2017 OpenCage. All rights reserved.
//

import UIKit

class OCBounds: NSObject {
    var northeastLatitude :NSNumber!
    var northeastLongitude :NSNumber!
    var southwestLatitude :NSNumber!
    var southwestLongitude :NSNumber!
}

class OCComponent: NSObject {
    
    var type :String = ""
    var city :String = ""
    var country :String = ""
    var countryCode :String = ""
    var postcode :String = ""
    var road :String = ""
    var state :String = ""
    var stateDistrict :String = ""
    var iso3166Code :String = ""
}

class OCGeoObject: NSObject {
    var confidence :Int = 0
    var formattedAddress :String = ""
    var latitude :NSNumber!
    var longitude :NSNumber!
    
    var bounds :OCBounds!
    var component :OCComponent!
    var annotations :[OCAnnotation] = []
    
    func setupWithData(dictionary :NSDictionary) {
        if let annotationsDict :NSDictionary = dictionary.object(forKey: "annotations") as? NSDictionary {
            let annotation :OCAnnotation = OCAnnotation()
            annotation.setupWithData(dictionary: annotationsDict)
            annotations.append(annotation)
        }
        
        if let formattedString :String = dictionary.object(forKey: "formatted") as? String {
            formattedAddress = formattedString
        }
        
        if let confidenceString :Int = dictionary.object(forKey: "confidence") as? Int {
            confidence = confidenceString
        }
        
        if let geometryDict :NSDictionary = dictionary.object(forKey: "geometry") as? NSDictionary {
            latitude = NSNumber(value:  geometryDict.object(forKey: "lat") as! Double)
            longitude = NSNumber(value:  geometryDict.object(forKey: "lng") as! Double)
        }
        
        bounds = OCBounds()
        if let boundsDict :NSDictionary = dictionary.object(forKey: "bounds") as? NSDictionary {
            if let northeastDict :NSDictionary = boundsDict.object(forKey: "northeast") as? NSDictionary {
                bounds.northeastLatitude = NSNumber(value:  northeastDict.object(forKey: "lat") as! Double)
                bounds.northeastLongitude = NSNumber(value:  northeastDict.object(forKey: "lng") as! Double)
            }
            
            if let southwestDict :NSDictionary = boundsDict.object(forKey: "southwest") as? NSDictionary {
                bounds.southwestLatitude = NSNumber(value:  southwestDict.object(forKey: "lat") as! Double)
                bounds.southwestLongitude = NSNumber(value:  southwestDict.object(forKey: "lng") as! Double)
            }
        }
        
        component = OCComponent()
        if let componentsDict :NSDictionary = dictionary.object(forKey: "components") as? NSDictionary {
            if let cityString :String = componentsDict.object(forKey: "city") as? String {
                component.city = cityString
            }
            
            if let countryString :String = componentsDict.object(forKey: "country") as? String {
                component.country = countryString
            }
            
            if let postcodeString :String = componentsDict.object(forKey: "postcode") as? String {
                component.postcode = postcodeString
            }
            
            if let roadString :String = componentsDict.object(forKey: "road") as? String {
                component.road = roadString
            }
            
            if let stateString :String = componentsDict.object(forKey: "state") as? String {
                component.state = stateString
            }
            
            if let stateDistrictString :String = componentsDict.object(forKey: "state_district") as? String {
                component.stateDistrict = stateDistrictString
            }
            
            if let countryCodeString :String = componentsDict.object(forKey: "country_code") as? String {
                component.countryCode = countryCodeString
            }
            
            if let isoCodeString :String = componentsDict.object(forKey: "ISO_3166-1_alpha-2") as? String {
                component.iso3166Code = isoCodeString
            }
            
            if let typeString :String = componentsDict.object(forKey: "_type") as? String {
                component.type = typeString
            }
        }
    }
}
