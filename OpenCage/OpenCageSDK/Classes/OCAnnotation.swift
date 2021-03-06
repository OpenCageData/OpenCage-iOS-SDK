//
//  OCAnnotation.swift
//  OpenCage
//
//  Created by Emu on 23/11/2017.
//  Copyright © 2017 OpenCage. All rights reserved.
//

import UIKit

public class OCCurrency :NSObject {
    public var alternateSymbols :NSArray = NSArray()
    public var decimalMark :String!
    public var htmlEntity :String!
    public var isoCode :String!
    public var isoNumeric :Int!
    public var name :String!
    public var smallestDenomination :NSNumber!
    public var subunit :String!
    public var subunitToUnit :Int!
    public var symbol :String!
    public var symbolFirst :Bool!
    public var thousandsSeparator :String!
}

public class OCTimeZone :NSObject {
    public var name :String!
    public var nowInDST :Int!
    public var offsetSeconds :Int!
    public var offsetString :String!
    public var shortName :String!
}

public class OCSunTimes :NSObject {
    public var sunriseApparent :Int!
    public var sunriseAstronomical :Int!
    public var sunriseCivil :Int!
    public var sunriseNautical :Int!
    
    public var sunsetApparent :Int!
    public var sunsetAstronomical :Int!
    public var sunsetCivil :Int!
    public var sunsetNautical :Int!
}

public class OCAnnotation: NSObject {
    public var DMSDictionary :NSDictionary!
    public var MGRS :String!
    public var maidenhead :String!
    public var mercatorDictionary :NSDictionary!
    public var OSGBDictionary :NSDictionary!
    public var osmURLDictionary :NSDictionary!
    public var callingCode :Int!
    public var currency :OCCurrency!
    public var geoHash :String!
    public var qibla :NSNumber!
    public var timezone :OCTimeZone!
    public var sunTimes :OCSunTimes!
    public var what3Words :String!
    
    func setupWithData(dictionary :NSDictionary) {
        if let mgrsString :String = dictionary.object(forKey: "MGRS") as? String {
            MGRS = mgrsString
        }
        
        if let maidenheadString :String = dictionary.object(forKey: "Maidenhead") as? String {
            maidenhead = maidenheadString
        }
        
        if let geoString :String = dictionary.object(forKey: "geohash") as? String {
            geoHash = geoString
        }
        
        if let qiblaDouble :Double = dictionary.object(forKey: "qibla") as? Double {
            qibla = NSNumber(value: qiblaDouble)
        }
        
        if let callCodeString :Int = dictionary.object(forKey: "callingcode") as? Int {
            callingCode = callCodeString
        }
        
        if let DMSDict :NSDictionary = dictionary.object(forKey: "DMS") as? NSDictionary {
            DMSDictionary = DMSDict
        }
        
        if let mercatorDict :NSDictionary = dictionary.object(forKey: "Mercator") as? NSDictionary {
            mercatorDictionary = mercatorDict
        }
        
        if let osgbDict :NSDictionary = dictionary.object(forKey: "OSGB") as? NSDictionary {
            OSGBDictionary = osgbDict
        }
        
        if let osmDict :NSDictionary = dictionary.object(forKey: "OSM") as? NSDictionary {
            osmURLDictionary = osmDict
        }
        
        if let whatDict :NSDictionary = dictionary.object(forKey: "what3words") as? NSDictionary {
            what3Words = whatDict.object(forKey: "words") as! String
        }
        
        timezone = OCTimeZone()
        if let timezoneDict :NSDictionary = dictionary.object(forKey: "timezone") as? NSDictionary {
            if let nameString :String = timezoneDict.object(forKey: "name") as? String {
                timezone.name = nameString
            }
            
            if let offsetString :String = timezoneDict.object(forKey: "offset_string") as? String {
                timezone.offsetString = offsetString
            }
            
            if let shortNameString :String = timezoneDict.object(forKey: "short_name") as? String {
                timezone.shortName = shortNameString
            }
            
            if let nowInDST :Int = timezoneDict.object(forKey: "now_in_dst") as? Int {
                timezone.nowInDST = nowInDST
            }
            
            if let offsetSeconds :Int = timezoneDict.object(forKey: "offset_sec") as? Int {
                timezone.offsetSeconds = offsetSeconds
            }
        }
        
        currency = OCCurrency()
        if let currencyDict :NSDictionary = dictionary.object(forKey: "currency") as? NSDictionary {
            if let decimalString :String = currencyDict.object(forKey: "decimal_mark") as? String {
                currency.decimalMark = decimalString
            }
            
            if let htmlString :String = currencyDict.object(forKey: "html_entity") as? String {
                currency.htmlEntity = htmlString
            }
            
            if let isoString :String = currencyDict.object(forKey: "iso_code") as? String {
                currency.isoCode = isoString
            }
            
            if let nameString :String = currencyDict.object(forKey: "name") as? String {
                currency.name = nameString
            }
            
            if let subUnitString :String = currencyDict.object(forKey: "subunit") as? String {
                currency.subunit = subUnitString
            }
            
            if let symbolString :String = currencyDict.object(forKey: "symbol") as? String {
                currency.symbol = symbolString
            }
            
            if let seperatorString :String = currencyDict.object(forKey: "thousands_separator") as? String {
                currency.thousandsSeparator = seperatorString
            }
            
            if let isoNumeric :Int = currencyDict.object(forKey: "iso_numeric") as? Int {
                currency.isoNumeric = isoNumeric
            }
            
            if let smallestDenomination :Int = currencyDict.object(forKey: "smallest_denomination") as? Int {
                currency.smallestDenomination = NSNumber(value: smallestDenomination)
            }
            
            if let symbolFirst :Bool = currencyDict.object(forKey: "symbol_first") as? Bool {
                currency.symbolFirst = symbolFirst
            }
            
            if let subunitUnit :Int = currencyDict.object(forKey: "subunit_to_unit") as? Int {
                currency.subunitToUnit = subunitUnit
            }
            
            if let alternateArray :NSArray = currencyDict.object(forKey: "alternate_symbols") as? NSArray {
                currency.alternateSymbols = alternateArray
            }
        }
        
        sunTimes = OCSunTimes()
        if let sunDict :NSDictionary = dictionary.object(forKey: "sun") as? NSDictionary {
            if let sunRise :NSDictionary = sunDict.object(forKey: "rise") as? NSDictionary {
                if let apparent :Int = sunRise.object(forKey: "apparent") as? Int {
                    sunTimes.sunriseApparent = apparent
                }
                
                if let astronomical :Int = sunRise.object(forKey: "astronomical") as? Int {
                    sunTimes.sunriseAstronomical = astronomical
                }
                
                if let civil :Int = sunRise.object(forKey: "civil") as? Int {
                    sunTimes.sunriseCivil = civil
                }
                
                if let nautical :Int = sunRise.object(forKey: "nautical") as? Int {
                    sunTimes.sunriseNautical = nautical
                }
            }
            
            if let sunSet :NSDictionary = sunDict.object(forKey: "set") as? NSDictionary {
                if let apparent :Int = sunSet.object(forKey: "apparent") as? Int {
                    sunTimes.sunsetApparent = apparent
                }
                
                if let astronomical :Int = sunSet.object(forKey: "astronomical") as? Int {
                    sunTimes.sunsetAstronomical = astronomical
                }
                
                if let civil :Int = sunSet.object(forKey: "civil") as? Int {
                    sunTimes.sunsetCivil = civil
                }
                
                if let nautical :Int = sunSet.object(forKey: "nautical") as? Int {
                    sunTimes.sunsetNautical = nautical
                }
            }
        }
    }
}
