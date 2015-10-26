//
//  RandomWord.swift
//  PasswordGenerator
//
//  Created by Lucas Smith on 10/19/15.
//  Copyright (c) 2015 Rachel Harvey. All rights reserved.
//

import Foundation

class RandomWord {
    
    let apiKey: String = "82DOKQHMApmshM7N0DVS2kVxNK8Np1WZ60Ajsn7iJ2TgacYGHW"
    let apiUrl: String = "https://wordsapiv1.p.mashape.com/words/"
    let maxLength: Int
    var request:NSMutableURLRequest! = nil
    
    init(length: Int){
        self.maxLength = length
    }
    
    func getRandomWord() -> String {
        let getURL:NSURL = getRequestUrl()
        setRequest(getURL)
        var word:String! = nil
        let semaphore = dispatch_semaphore_create(0)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(self.request) {
            data, response, error in
            if error != nil {
                word = "Network Error"
            } else {
                let json = self.parseJson(data!)
                word = json["word"] as! String
                //completion(word: word);
            }
            dispatch_semaphore_signal(semaphore)
        }
        task.resume()
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        return word
    }
    
    func parseJson(data: NSData) -> NSDictionary{
        let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions())
        return json as! NSDictionary
    }
    
    func getRequestUrl() -> NSURL{
        let query:String = "?random=true&lettersMax=" + String(self.maxLength)+"&lettersmin=1"
        return NSURL(string: apiUrl + query)!
    }
    
    func setRequest(getURL: NSURL) -> Void{
        self.request = NSMutableURLRequest(URL: getURL)
        self.request.HTTPMethod = "GET"
        self.request.setValue("application/json", forHTTPHeaderField: "Accept")
        self.request.setValue(apiKey, forHTTPHeaderField: "X-Mashape-Key")
    }
}