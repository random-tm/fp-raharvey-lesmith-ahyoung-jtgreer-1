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
        return "beaver"
    }
}