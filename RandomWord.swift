//
//  RandomWord.swift
//  PasswordGenerator
//
//  Created by Lucas Smith on 10/19/15.
//  Copyright (c) 2015 Rachel Harvey. All rights reserved.
//

import Foundation

class RandomWord {
    
    init(length: Int){
        
    }
    
    func getRandomWord(maxLength: Int) -> String {
        
        let getURL:NSURL = NSURL(string: "https://wordsapiv1.p.mashape.com/words/?random=true&lettersMax=" + String(maxLength)+"&lettersmin=1")!
        let request = NSMutableURLRequest(URL: getURL)
        
        request.HTTPMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("82DOKQHMApmshM7N0DVS2kVxNK8Np1WZ60Ajsn7iJ2TgacYGHW", forHTTPHeaderField: "X-Mashape-Key")
        
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                
            } else {
                let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions())
                print(json);
            }
        }
        task.resume()
        return "banana"
    }
}