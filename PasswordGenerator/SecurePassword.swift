//
//  SecurePassword.swift
//  PasswordGenerator
//
//  Created by admin on 10/19/15.
//  Copyright © 2015 Rachel Harvey. All rights reserved.
//

import Foundation

class SecurePassword {
    
    var password: String! = nil
    var length: Int! = nil
    
    init(length: Int) {
        self.length = length
        self.password = self.generateRandomPassword()
    }
    
    func generateRandomPassword() -> String {
        var randomString: String = ""
        for _ in 0..<self.length {
            randomString += self.getRandomCharacter()
        }
        return randomString
    }
    
    func getRandomCharacter() -> String {
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        let randomNum = Int(arc4random_uniform(UInt32(characters.characters.count)))
        return String(characters[characters.startIndex.advancedBy(randomNum)])
    }
}