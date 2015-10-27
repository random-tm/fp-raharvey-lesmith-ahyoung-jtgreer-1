//
//  MemorablePassword.swift
//  PasswordGenerator
//
//  Created by admin on 10/19/15.
//  Copyright © 2015 Rachel Harvey. All rights reserved.
//

import Foundation

class MemorablePassword {
    
    private var password:String! = nil
    private var randomWordGeneratorOne:RandomWord! = nil
    private var randomWordGeneratorTwo:RandomWord! = nil
    private var maxLength:Int! = nil
    
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
    
    private func getWordWithoutSpaces(randomWordGenerator:RandomWord) -> String{
        var string = " -"
        while(checkForSpaces(string) || checkForHypens(string)){
            string = randomWordGenerator.getRandomWord()
        }
        return string
    }
    
    private func checkForSpaces(string:String) -> Bool{
        if(string.containsString(" ")){
            return true
        } else {
            return false
        }
    }
    
    private func checkForHypens(string:String) -> Bool{
        if(string.containsString("-")){
            return true
        } else {
            return false
        }
    }
    
    private func initRandomWordWithLengthDifference(word: String) -> RandomWord{
        let randomWordTwoLength:Int = self.maxLength - getStringLength(word)
        return RandomWord(length: randomWordTwoLength)
    }
    
    private func getStringLength(string : String) -> Int{
        return string.characters.count
    }
}
