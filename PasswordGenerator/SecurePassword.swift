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
        let passwordGenerator = CryptoswiftWrapper.init(length: length)
        self.password = passwordGenerator.getPassword()
        return self.password
    }
    
}