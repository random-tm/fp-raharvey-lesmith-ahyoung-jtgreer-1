//
//  CannedWord.swift
//  PasswordGenerator
//
//  Created by user113999 on 11/16/15.
//  Copyright © 2015 Rachel Harvey. All rights reserved.
//

import Foundation

class CannedWord: WordProtocol{
    
    private var word:String!
    
    func getRandomWord(maxLength: Int, minLength: Int) ->String {
        if let path = NSBundle.mainBundle().pathForResource("Canned_Word", ofType: "json") {
            self.extractJsonData(path)
        }
        return self.word
    }
    
    func extractJsonData(path: String) {
        if let jsonData: NSData! = try! NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingUncached) {
            self.extractJsonResult(jsonData)
        }
    }
    
    func extractJsonResult(jsonData: NSData) {
        if let jsonResult: NSDictionary = try! NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
            self.extractStringFromJson(jsonResult)
        }
    }
    
    func extractStringFromJson(jsonResult: NSDictionary) {
        if let cannedWord: String = jsonResult["word"] as? String {
            self.word = cannedWord
        }
    }
}