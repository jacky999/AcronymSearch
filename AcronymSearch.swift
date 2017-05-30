//
//  AcronymSearch.swift
//  Acronym
//
//  Created by Jack on 5/29/17.
//  Copyright © 2017 AMT. All rights reserved.
//  Copy from GITHUV Version
//

import Foundation
import AFNetworking

class AcronymSearch {
    
    private var _keywords : String!
    private var _searchUrl : String!
    
    
    var keywords: String {
        get {
            if (_keywords == nil) {
                _keywords = ""
            }
            return _keywords
        }
        set (newVal) {
            self._keywords = newVal
        }
        
    }
    
    init () {
        
    }
    
    func getSearchResults(keyword: String, completion: @escaping (_ result: [String]) -> ()) {
        
        _searchUrl = BASE_URL + keyword
        
        let manager = AFHTTPSessionManager()
        
        manager.requestSerializer = AFHTTPRequestSerializer()
        manager.responseSerializer = AFJSONResponseSerializer()
        manager.responseSerializer.acceptableContentTypes = ["text/plain", "text/html", "application/json"]
        
        let task = manager.get(_searchUrl, parameters: nil, progress: nil, success: {
            (dataTask, responseObj) in
            
            guard let responseObj = responseObj else {
                print("Response Error!")
                return
            }
            
            completion(self.JSONParsing(responseObject: responseObj))
            
        }, failure: {
            (dataTask, error) in
            print(error.localizedDescription)
        }
            
        )
        
        task?.resume()
        
    }
    
    private func JSONParsing (responseObject: Any) -> ([String]) {
        
        var resultList = [String] ()
        
        if let jsonArray = responseObject as? NSArray {
            
            if (jsonArray.count == 0) {
                resultList.append(NORESULT)
                print("There are no search results")
                
                return resultList
                
            }
            
            if let jsonObj = jsonArray[0] as? NSDictionary {
                if let sf = jsonObj["sf"] as? String {
                    let shortform = PREFIX_1 + SHORTFORM + sf
                    resultList.append(shortform)
                }
                
                if let lfs = jsonObj["lfs"] as? [NSDictionary] {
                    
                    for lfsItem in lfs {
                        var longform = PREFIX_2
                        
                        if let lfslf = lfsItem ["lf"] as? String {
                            longform += LONGFORM + lfslf + DELIMITER
                            
                        }
                        if let lfsfreq = lfsItem ["freq"] as? Int {
                            longform +=  FREQ + "\(lfsfreq)" + DELIMITER
                        }
                        if let lfssince = lfsItem ["since"] as? Int {
                            longform += SINCE + "\(lfssince)"
                        }
                        
                        resultList.append(longform)
                        
                        if let lfsvars = lfsItem["vars"] as? [NSDictionary] {
                            for lfsvarsItem in lfsvars {
                                var longformVariation = PREFIX_3
                                if let lfsvarslf = lfsvarsItem["lf"] as? String {
                                    longformVariation += LONGFORM + lfsvarslf + DELIMITER
                                }
                                if let lfsvarsfreq = lfsvarsItem["freq"] as? Int {
                                    longformVariation += FREQ + "\(lfsvarsfreq)" + DELIMITER
                                }
                                if let lfsvarssince = lfsvarsItem["since"] as? Int {
                                    longformVariation += SINCE + "\(lfsvarssince)"
                                }
                                
                                resultList.append(longformVariation)
                            }
                        }
                    }
                }
            }
            
        }
        return resultList
    }
    
    
    
    
}
