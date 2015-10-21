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
    
    init(length: Int) {
        let randomWord = RandomWord(length: 12)
        self.password = randomWord.getRandomWord(9)
    }
}
