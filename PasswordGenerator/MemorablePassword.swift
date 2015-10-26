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
    var randomWordOne: RandomWord! = nil
    
    init(length: Int) {
        self.randomWordOne = RandomWord(length: 8)
    }

    func getRandomWord() -> String{
        self.randomWordOne.getRandomWord({ (word : String) in
            let randomWordTwoLength: Int = 12 - word.characters.count
            let randomWordTwo = RandomWord(length: randomWordTwoLength)
            randomWordTwo.getRandomWord({ (word2 : String) in
                self.password = word + word2
            })
        })
        return self.password
    }
}
