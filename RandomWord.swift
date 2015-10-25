//
//  RandomWord.swift
//  PasswordGenerator
//
//  Created by Lucas Smith on 10/19/15.
//  Copyright (c) 2015 Rachel Harvey. All rights reserved.
//

import Foundation

class RandomWord {
    
    let maxLength: Int
    
    init(length: Int){
        self.maxLength = length
    }
    
    func getRandomWord(completion:(word: String)->()) -> Void {
        
        let getURL:NSURL = NSURL(string: "https://wordsapiv1.p.mashape.com/words/?random=true&lettersMax=" + String(self.maxLength)+"&lettersmin=1")!
        let request = NSMutableURLRequest(URL: getURL)
        
        request.HTTPMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("82DOKQHMApmshM7N0DVS2kVxNK8Np1WZ60Ajsn7iJ2TgacYGHW", forHTTPHeaderField: "X-Mashape-Key")
        
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
}