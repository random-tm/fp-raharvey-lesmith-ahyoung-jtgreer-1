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
    let maxLength: Int
    var request:NSMutableURLRequest! = nil
    
    init(length: Int){
        self.maxLength = length
    }
    
    func getRandomWord(completion:(word: String)->()) -> Void {
        
        let getURL:NSURL = NSURL(string: "https://wordsapiv1.p.mashape.com/words/?random=true&lettersMax=" + String(self.maxLength)+"&lettersmin=1")!
        setRequest(getURL)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                
            } else {
                let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions())
                let word = json["word"] as! String
                completion(word: word);
            }
        }
        task.resume()
    }
    
    func setRequest(getURL: NSURL) -> Void{
        self.request = NSMutableURLRequest(URL: getURL)
        self.request.HTTPMethod = "GET"
        self.request.setValue("application/json", forHTTPHeaderField: "Accept")
        self.request.setValue(apiKey, forHTTPHeaderField: "X-Mashape-Key")
    }
}