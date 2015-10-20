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
    
    init(length: Int) {
        self.password = self.generateRandomPassword(length)
    }
    
    func generateRandomPassword(length: Int) -> String {
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        var randomString: String = ""
        for _ in 0..<length {
            let randomNum = Int(arc4random_uniform(UInt32(characters.characters.count)))
            randomString += String(characters[characters.startIndex.advancedBy(randomNum)])
        }
        return randomString
    }
}