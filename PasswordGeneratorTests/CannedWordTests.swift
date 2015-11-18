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
        XCTAssert(wordGenerator.getRandomWord(6, minLength: 6) as String! != nil)
    }
    
    func testMemorableGenerationLength() {
        let wordGenerator = CannedWord()
        XCTAssert(wordGenerator.getRandomWord(6, minLength: 6) == "beaver")
    }
    
}
