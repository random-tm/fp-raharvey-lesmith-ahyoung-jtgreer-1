//
//  CannedWord.swift
//  PasswordGenerator
//
//  Created by user113999 on 11/16/15.
//  Copyright © 2015 Rachel Harvey. All rights reserved.
//

import Foundation
class CannedWord: WordProtocol{
    private var word:String! = nil
    
    func getRandomWord() ->String {
        self.word = "wordidntwork"
        if let path = NSBundle.mainBundle().pathForResource("Canned_Word", ofType: "json")
            {
                if let jsonData: NSData! = try! NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingUncached)
                {
                    if let jsonResult: NSDictionary = try! NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
                    {
                        if let test: String = jsonResult["1"] as? String
                        {
                            self.word = test
                        }
                    }
                }
        }
        return self.word
    }
}