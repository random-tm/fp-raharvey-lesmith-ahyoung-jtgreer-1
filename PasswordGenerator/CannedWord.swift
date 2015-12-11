//
//  CannedWord.swift
//  PasswordGenerator
//
//  Created by Aaron Young on 11/16/15.
//  Copyright © 2015 Rachel Harvey, Lucas Smith, Aaron Young, and Jeffery Greer. All rights reserved.
//

import Foundation

class CannedWord: WordSupplier{
    
    private let word:String = "PleasurefulNonarticulate"
    
    func getRandomWord(maxLength: Int, minLength: Int) ->String {
        return trimWordToTength(maxLength)
    }
    
    func trimWordToTength(desiredLength: Int) -> String {
        return word.substringToIndex(word.startIndex.advancedBy(desiredLength))
    }
    
}