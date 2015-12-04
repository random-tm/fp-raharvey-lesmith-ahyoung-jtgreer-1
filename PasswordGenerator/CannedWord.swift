//
//  CannedWord.swift
//  PasswordGenerator
//
//  Created by Aaron Young on 11/16/15.
//  Copyright © 2015 Rachel Harvey, Lucas Smith, Aaron Young, and Jeffery Greer. All rights reserved.
//

import Foundation

class CannedWord: WordSupplier{
    
    private var word:String!
    
    func getRandomWord(maxLength: Int, minLength: Int) ->String {
        if let path = NSBundle.mainBundle().pathForResource("Canned_Word", ofType: "json") {
            self.extractJsonData(path)
        }
        return self.word
    }
    
    func extractJsonData(path: String) -> Void {
        if let jsonData: NSData! = try! NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingUncached) {
            self.extractJsonResult(jsonData)
        }
    }
    
    func extractJsonResult(jsonData: NSData) -> Void {
        if let jsonResult: NSDictionary = try! NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
            self.extractStringFromJson(jsonResult)
        }
    }
    
    func extractStringFromJson(jsonResult: NSDictionary) -> Void {
        if let cannedWord: String = jsonResult["word"] as? String {
            self.word = cannedWord
        }
    }
}