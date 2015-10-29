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
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMemorablePasswordIsNotNil() {
        let password = MemorablePassword(length: 12)
        XCTAssert(password.getRandomWords() != nil)
    }
    
    func testMemorableGenerationLength() {
        let password = MemorablePassword(length: 12)
        XCTAssert(password.getRandomWords().characters.count == 12)
    }
    
    func testTwoMemorablePasswordAreNotEqual() {
        let passwordOne = MemorablePassword(length: 12)
        let passwordTwo = MemorablePassword(length: 12)
        XCTAssert(passwordOne.getRandomWords() != passwordTwo.getRandomWords())
    }
    
}
