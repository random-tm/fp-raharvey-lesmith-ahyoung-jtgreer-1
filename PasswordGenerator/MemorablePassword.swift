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
        let randomWord = RandomWord(length: 8)
        randomWord.getRandomWord({ (word : String) in
            self.password = word;
            let randomWord2Length: Int = 12 - self.password.characters.count
            let randomWord2 = RandomWord(length: randomWord2Length)
            randomWord2.getRandomWord({ (word2 : String) in
                self.password = word2 + self.password
            })
        })
    }

}
