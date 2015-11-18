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
        let password = MemorablePassword(length: 12, wordGenerator: wordGenerator)
        XCTAssert(password.getRandomWords() != nil)
    }
    
    func testMemorableGenerationLength() {
        let wordGenerator = CannedWord()
        let password = MemorablePassword(length: 12, wordGenerator: wordGenerator)
        XCTAssert(password.getRandomWords().characters.count == 12)
    }
    
}
