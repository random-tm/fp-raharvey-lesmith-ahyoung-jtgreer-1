//
//  SecurePassword.swift
//  PasswordGenerator
//
//  Created by Rachel Harvey on 10/19/15.
//  Copyright © 2015 Rachel Harvey, Lucas Smith, Aaron Young, and Jeffery Greer. All rights reserved.
//

import Foundation

class SecurePassword {
    
    private var password: String! = nil
    private var length: Int! = nil
    
    init(length: Int) {
        self.length = length
    }
    
    func getRandomPassword() -> String! {
        self.password = self.generateRandomPassword()
        return self.password
    }
    
    private func generateRandomPassword() -> String {
        var randomString: String = ""
        for _ in 0..<self.length {
            randomString += self.getRandomCharacter()
        }
        return randomString
    }
    
    private func getRandomCharacter() -> String {
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        let charactersLength = getCharacterCount(characters)
        let randomNum = getRandomNumberUpto(charactersLength)
        return String(getCharacter(characters, index: randomNum))
    }
    
    private func getCharacterCount(string: String) -> Int{
        return string.characters.count
    }
    
    private func getRandomNumberUpto(number:Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    private func getCharacter(string:String, index:Int) -> Character{
        return string[string.startIndex.advancedBy(index)]
    }
}