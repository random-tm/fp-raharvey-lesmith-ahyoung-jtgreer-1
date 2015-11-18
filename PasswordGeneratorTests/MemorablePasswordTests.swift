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
        let length = 12
        let password = MemorablePassword()
        XCTAssert(password.getRandomWord() != nil)
    }
    
    func testMemorableGenerationLength() {
        let password = MemorablePassword(length: 12)
        XCTAssert(password.getRandomWords().characters.count == 12)
    }
    
}
