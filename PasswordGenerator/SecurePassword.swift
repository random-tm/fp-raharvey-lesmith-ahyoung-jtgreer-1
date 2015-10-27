//
//  SecurePassword.swift
//  PasswordGenerator
//
//  Created by admin on 10/19/15.
//  Copyright © 2015 Rachel Harvey. All rights reserved.
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
        let randomNum = Int(arc4random_uniform(UInt32(characters.characters.count)))
        return String(characters[characters.startIndex.advancedBy(randomNum)])
    }
}