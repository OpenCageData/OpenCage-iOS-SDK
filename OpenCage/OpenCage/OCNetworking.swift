//
//  OCNetworking.swift
//  OpenCage
//
//  Created by Emu on 21/11/2017.
//  Copyright © 2017 OpenCage. All rights reserved.
//

import UIKit

typealias AsyncCompletionBlock  = (_ resultDictionary: NSDictionary, _ success: Bool, _ error: NSError?) -> ()

class OCNetworking: NSObject {
    static let sharedInstance = OCNetworking()
    
    func baseURL() -> String {
        return "https://vitpa-api.herokuapp.com/"
    }
    
    func reverseGeocode(parameters :String, apiKey :String, completionBlock :@escaping AsyncCompletionBlock) {
        
    }
    
    func forwardGeocode(parameters :String, apiKey :String, completionBlock :@escaping AsyncCompletionBlock) {
        
    }
    
    func downloadDataFromURL(_ url: URL, bodyString: NSString, type: String, completionBlock:@escaping AsyncCompletionBlock) {
        let request = NSMutableURLRequest(url: url, cachePolicy: NSURLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 10)
        if bodyString.length > 0 {
            request.httpBody = bodyString.data(using: String.Encoding.utf8.rawValue)
        }
        
        if type.isEmpty  {
            request.httpMethod = "GET"
        }
        else {
            request.httpMethod = type
        }
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
                    error = NSError(domain: "Something gone wrong", code: 0, userInfo: [:])
                }
            }
            
            completionBlock(dict!, success, error)
        })
        
        task.resume()
    }
    
    func escapeCharacters(_ string :NSString) -> NSString {
        let customAllowedSet =  CharacterSet(charactersIn:"\"#%/<>?@\\^`{|}+").inverted
        let escapedString = string.addingPercentEncoding(withAllowedCharacters: customAllowedSet)
        
        return escapedString! as NSString
    }
    
}
