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
    var maxLength:Int! = nil
    
    init(length: Int) {
        self.maxLength = length
        self.randomWordGeneratorOne = RandomWord(length: 8)
    }

    func getRandomWord() -> String!{
        let word = getWordWithoutSpaces(randomWordGeneratorOne)
        self.randomWordGeneratorTwo = self.initRandomWordWithLengthDifference(word)
        let word2 = getWordWithoutSpaces(randomWordGeneratorTwo)
        self.password = word + word2
        return self.password
    }
    
    func getWordWithoutSpaces(randomWordGenerator:RandomWord) -> String{
        var string = " -"
        while(checkForSpaces(string) || checkForHypens(string)){
            string = randomWordGenerator.getRandomWord()
        }
        return string
    }
    
    func checkForSpaces(string:String) -> Bool{
        if(string.containsString(" ")){
            return true
        } else {
            return false
        }
    }
    
    func checkForHypens(string:String) -> Bool{
        if(string.containsString("-")){
            return true
        } else {
            return false
        }
    }
    
    func initRandomWordWithLengthDifference(word: String) -> RandomWord{
        let randomWordTwoLength:Int = self.maxLength - getStringLength(word)
        return RandomWord(length: randomWordTwoLength)
    }
    
    func getStringLength(string : String) -> Int{
        return string.characters.count
    }
}
