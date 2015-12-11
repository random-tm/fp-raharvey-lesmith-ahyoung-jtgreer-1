//
//  CannedWordTests.swift
//  PasswordGenerator
//
//  Created by Rachel Harvey on 11/18/15.
//  Copyright © 2015 Rachel Harvey, Lucas Smith, Aaron Young, and Jeffery Greer. All rights reserved.
//

import XCTest
@testable import PasswordGenerator

class CannedWordTests: XCTestCase {
    
    func testCannedWordIsNotNil() {
        let wordGenerator = CannedWord()
        for length in 12...24 {
            XCTAssert(wordGenerator.getRandomWord(length, minLength: 1) as String! != nil)
        }
    }
    
    func testMemorableGenerationLength() {
        let wordGenerator = CannedWord()
        for length in 12...24 {
            let word = wordGenerator.getRandomWord(length, minLength: 1)
            XCTAssert(word.characters.count == length)
        }
    }
    
}
