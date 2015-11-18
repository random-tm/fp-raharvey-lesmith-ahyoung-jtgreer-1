//
//  MemorablePassword.swift
//  PasswordGenerator
//
//  Created by Rachel Harvey on 10/19/15.
//  Copyright © 2015 Rachel Harvey, Lucas Smith, Aaron Young, and Jeffery Greer. All rights reserved.
//

import Foundation

class MemorablePassword: NSObject {
    
    private var password:String! = nil
    private var passwordLength:Int! = nil
    private var wordGenerator:WordProtocol! = nil
    
    init(length: Int, wordGenerator:WordProtocol) {
        self.passwordLength = length
        self.wordGenerator = wordGenerator
    }
    
    func getRandomWords() -> String{
        let wordOne = getWordWithoutSpacesOrHypens(8,minLength: 1)
        let lengthOfSecondWord:Int = self.passwordLength - getStringLength(wordOne)
        let wordTwo = getWordWithoutSpacesOrHypens(lengthOfSecondWord, minLength: lengthOfSecondWord)
        self.password = wordOne + wordTwo
        return self.password
    }

    private func getWordWithoutSpacesOrHypens(maxLength:Int,minLength:Int) -> String{
        var string = wordGenerator.getRandomWord(maxLength, minLength: minLength)
        while(containsSpaces(string) || checkForHypens(string)){
            string = wordGenerator.getRandomWord(maxLength, minLength: minLength)
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
    
    private func containsSpaces(string:String) -> Bool{
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
    
    private func getStringLength(string : String) -> Int{
        return string.characters.count
    }

    func checkForNetworkError() -> Bool{
        if(self.password.rangeOfString("NetworkError") != nil) {
            return true
        } else {
            return false
        }
    }
    
}
