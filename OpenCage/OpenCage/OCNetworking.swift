//
//  OCNetworking.swift
//  OpenCage
//
//  Created by Emu on 21/11/2017.
//  Copyright © 2017 OpenCage. All rights reserved.
//

import UIKit

typealias AsyncCompletionBlock  = (_ resultDictionary: NSDictionary, _ success: Bool, _ error: NSError?) -> ()
typealias ReverseGeocoderCompletionBlock  = (_ resultDictionary: NSDictionary, _ success: Bool, _ error: NSError?) -> ()
typealias ForwardGeocoderCompletionBlock  = (_ resultDictionary: NSDictionary, _ success: Bool, _ error: NSError?) -> ()

class OCNetworking: NSObject {
    static let sharedInstance = OCNetworking()
    
    func baseURL() -> String {
        return "https://api.opencagedata.com/geocode/v1/json?key="
    }
    
    func reverseGeocode(latitude :NSNumber, longitude :NSNumber, withAnnotations :Bool, apiKey :String, completionBlock :@escaping ReverseGeocoderCompletionBlock) {
        let latLongString = String(format: "%@+%@", latitude.stringValue, longitude.stringValue)
        var urlString = String(format: "%@%@&language=en&pretty=1&q=", baseURL(), escapeCharacters(apiKey), escapeCharacters(latLongString))
        
        if withAnnotations == false {
            urlString = urlString.appending("&no_annotations=1")
        }
        
        let url :URL = URL(string: urlString)!
        downloadDataFromURL(url) { (dict, success, error) in
            
        }
    }
    
    func forwardGeocode(address :String, withAnnotations :Bool, apiKey :String, completionBlock :@escaping ForwardGeocoderCompletionBlock) {
        var urlString = String(format: "%@%@&language=en&pretty=1&q=", baseURL(), escapeCharacters(apiKey), escapeCharacters(address))
        
        if withAnnotations == false {
            urlString = urlString.appending("&no_annotations=1")
        }
        
        let url :URL = URL(string: urlString)!
        downloadDataFromURL(url) { (dict, success, error) in
            
        }
    }
    
    func downloadDataFromURL(_ url: URL, completionBlock:@escaping AsyncCompletionBlock) {
        let request = NSMutableURLRequest(url: url, cachePolicy: NSURLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 10)
        request.httpMethod = "GET"
        self.downloadDataFromRequest(request as URLRequest, completionBlock: completionBlock)
    }
    
    func downloadDataFromRequest(_ request: URLRequest, completionBlock:@escaping AsyncCompletionBlock) {
        let sessionConfig :URLSessionConfiguration = URLSessionConfiguration.default
        
        let session = URLSession(configuration: sessionConfig)
        let task = session.dataTask(with: request, completionHandler: {
            (
            data, response, error) in
            
            guard let _:Data = data, let _:URLResponse = response, error == nil else {
                completionBlock(NSDictionary(), false, error as NSError?)
                return
            }
            
            var dict :NSDictionary?
            
            do {
                dict = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary
            } catch _ as NSError {
                
            }
            
            let string = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            if dict == nil {
                dict = NSDictionary(object: string!, forKey: "data" as NSCopying)
            }
            
            var success = true
            var error :NSError?
            if dict!.object(forKey: "error") != nil {
                success = false
                if let string :String = dict!.object(forKey: "error") as? String {
                    error = NSError(domain: string, code: 0, userInfo: [:])
                }
                else  {
                    error = NSError(domain: "Somethings gone wrong", code: 0, userInfo: [:])
                }
            }
            
            completionBlock(dict!, success, error)
        })
        
        task.resume()
    }
    
    func escapeCharacters(_ string :String) -> String {
        let customAllowedSet =  CharacterSet(charactersIn:"\"#%/<>?@\\^`{|}+").inverted
        let escapedString = string.addingPercentEncoding(withAllowedCharacters: customAllowedSet)
        
        return escapedString! as String
    }
    
}
