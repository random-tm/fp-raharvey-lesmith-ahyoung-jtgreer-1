//
//  MemorablePasswordTests.swift
//  PasswordGenerator
//
//  Created by Rachel Harvey on 10/22/15.
//  Copyright © 2015 Rachel Harvey, Lucas Smith, Aaron Young, and Jeffery Greer. All rights reserved.
//

import XCTest
@testable import PasswordGenerator

class MemorablePasswordTests: XCTestCase {
    
    func testMemorablePasswordIsNotNil() {
        let wordGenerator = CannedWord()
        for length in 12...24 {
            let password = MemorablePasswordFactory(length: length, wordGenerator: wordGenerator)
            XCTAssert(password.getRandomWords() != nil)
        }
    }
    
    func testMemorableGenerationLength() {
        let wordGenerator = CannedWord()
        for length in 12...24 {
            let password = MemorablePasswordFactory(length: length, wordGenerator: wordGenerator)
            let word = password.getRandomWords()
            XCTAssert(isLengthEqualTo(word, length: length))
        }
    }
    
    private func isLengthEqualTo(word: String, length: Int) -> Bool{
        let wordLength = word.characters.count
        if(wordLength == length){
            return true
        } else {
            return false
        }
    }
    
}
