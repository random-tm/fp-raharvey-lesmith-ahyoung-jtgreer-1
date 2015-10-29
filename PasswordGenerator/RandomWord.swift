//
//  RandomWord.swift
//  PasswordGenerator
//
//  Created by Lucas Smith on 10/19/15.
//  Copyright © 2015 Rachel Harvey, Lucas Smith, Aaron Young, and Jeffery Greer. All rights reserved.
//

import Foundation

class RandomWord {
    
    private let apiKey: String = "82DOKQHMApmshM7N0DVS2kVxNK8Np1WZ60Ajsn7iJ2TgacYGHW"
    private let apiUrl: String = "https://wordsapiv1.p.mashape.com/words/"
    private let maxLength: Int
    private let minLength: Int
    private var requestHeaders:NSMutableURLRequest! = nil
    private var word:String! = nil
    
    init(maxLength: Int, minLength: Int){
        self.maxLength = maxLength
        self.minLength = minLength
        let getURL:NSURL = getRequestUrl()
        setRequestHeaders(getURL)
    }
    
    private func getRequestUrl() -> NSURL{
        let query:String = getQuery()
        return NSURL(string: apiUrl + query)!
    }
    
    private func getQuery() -> String{
        if (minLengthEqualsMaxLength()) {
            return "?random=true&letters="+String(self.maxLength)
        } else {
            return "?random=true&lettersMax="+String(self.maxLength)+"&lettersMin="+String(self.minLength)
        }
    }
    
    private func minLengthEqualsMaxLength()->Bool{
        if (self.minLength == self.maxLength) {
            return true
        } else {
            return false
        }
    }
    
    private func setRequestHeaders(getURL: NSURL) -> Void{
        self.requestHeaders = NSMutableURLRequest(URL: getURL)
        self.requestHeaders.HTTPMethod = "GET"
        self.requestHeaders.setValue("application/json", forHTTPHeaderField: "Accept")
        self.requestHeaders.setValue(apiKey, forHTTPHeaderField: "X-Mashape-Key")
    }
    
    func getRandomWord() -> String {
        let semaphore = dispatch_semaphore_create(0)
        let task = createNetworkTask(semaphore)
        task.resume()
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        return self.word
    }
    
    private func createNetworkTask(semaphore:dispatch_semaphore_t) -> NSURLSessionDataTask{
        let task = NSURLSession.sharedSession().dataTaskWithRequest(self.requestHeaders) {
            data, response, error in
            self.parseNetworkData(data, error: error)
            dispatch_semaphore_signal(semaphore)
        }
        return task
    }
    
    private func parseNetworkData(data:NSData?, error:NSError?) -> Void{
        if (error != nil) {
            self.word = "NetworkError"
        } else {
            let json = self.parseJson(data!)
            self.word = json["word"] as! String
        }
    }
    
    private func parseJson(data: NSData) -> NSDictionary{
        let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions())
        return json as! NSDictionary
    }

}