//
//  MemorablePassword.swift
//  PasswordGenerator
//
//  Created by admin on 10/19/15.
//  Copyright © 2015 Rachel Harvey. All rights reserved.
//

import Foundation

class MemorablePassword {
    
    var password:String! = nil
    var randomWordGeneratorOne:RandomWord! = nil
    var randomWordGeneratorTwo:RandomWord! = nil
    let maxLength:Int! = nil
    
    init(length: Int) {
        self.randomWordGeneratorOne = RandomWord(length: 8)
    }

    func getRandomWord() -> String{
        let word = self.randomWordGeneratorOne.getRandomWord()
        self.randomWordGeneratorTwo = self.initRandomWordWithLengthDifference(word)
        let word2 = self.randomWordGeneratorTwo.getRandomWord()
        self.password = word + word2
        return self.password
    }
    
    func initRandomWordWithLengthDifference(word: String) -> RandomWord{
        let randomWordTwoLength:Int = self.maxLength - getStringLength(word)
        return RandomWord(length: randomWordTwoLength)
    }
    
    func getStringLength(string : String) -> Int{
        return string.characters.count
    }
}
