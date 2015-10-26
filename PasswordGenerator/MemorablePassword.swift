//
//  MemorablePassword.swift
//  PasswordGenerator
//
//  Created by admin on 10/19/15.
//  Copyright © 2015 Rachel Harvey. All rights reserved.
//

import Foundation

class MemorablePassword {
    
    var password: String! = nil
    var randomWordOne: RandomWord! = nil
    var randomWordTwo: RandomWord! = nil
    
    init(length: Int) {
        self.randomWordOne = RandomWord(length: 8)
    }

    func getRandomWord() -> String{
        let word = self.randomWordOne.getRandomWord()
        self.randomWordTwo = self.initRandomWordWithLengthDifference(word, length: 12)
        let word2 = self.randomWordTwo.getRandomWord()
        self.password = word + word2
        return self.password
    }
    
    func initRandomWordWithLengthDifference(word: String, length: Int) -> RandomWord{
        let randomWordTwoLength: Int = length - getStringLength(word)
        return RandomWord(length: randomWordTwoLength)
    }
    
    func getStringLength(string : String) -> Int{
        return string.characters.count
    }
}
