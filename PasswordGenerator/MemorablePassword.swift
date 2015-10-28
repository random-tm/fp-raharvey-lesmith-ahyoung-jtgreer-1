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
    private var passwordLength:Int! = nil
    
    init(length: Int) {
        self.passwordLength = length
        self.randomWordGeneratorOne = RandomWord(maxLength: 8, minLength: 1)
    }
    
    func getRandomWords() -> String!{
        let wordOne = getWordWithoutSpacesOrHypens(randomWordGeneratorOne)
        self.randomWordGeneratorTwo = self.initRandomWordWithLengthDifference(wordOne)
        let wordTwo = getWordWithoutSpacesOrHypens(randomWordGeneratorTwo)
        self.password = wordOne + wordTwo
        return self.password
    }
    
    private func getWordWithoutSpacesOrHypens(randomWordGenerator:RandomWord) -> String{
        var string = randomWordGenerator.getRandomWord()
        while(checkForSpaces(string) || checkForHypens(string)){
            string = randomWordGenerator.getRandomWord()
        }
        return capitalizeFirstLetter(string)
    }
    
    private func capitalizeFirstLetter(string:String) -> String{
        let firstLetter:String = getFirstLetter(string).capitalizedString
        let restOfString:String = getStringAndSkipFirstLetter(string)
        return firstLetter + restOfString
    }
    
    private func getFirstLetter(string:String) -> String{
        return string.substringToIndex(string.startIndex.advancedBy(1))
    }
    
    private func getStringAndSkipFirstLetter(string:String) -> String{
        return string.substringFromIndex(string.startIndex.advancedBy(1))
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
        let randomWordTwoLength:Int = self.passwordLength - getStringLength(word)
        return RandomWord(maxLength: randomWordTwoLength, minLength: randomWordTwoLength)
    }
    
    private func getStringLength(string : String) -> Int{
        return string.characters.count
    }
    
    func checkForPasswordError() -> Bool{
        if(self.password.rangeOfString("NetworkError") != nil) {
            return true
        } else {
            return false
        }
    }
    
}
