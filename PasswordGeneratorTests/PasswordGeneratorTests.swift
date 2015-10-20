//
//  PasswordGeneratorTests.swift
//  PasswordGeneratorTests
//
//  Created by admin on 10/19/15.
//  Copyright © 2015 Rachel Harvey. All rights reserved.
//

import XCTest
@testable import PasswordGenerator

class PasswordGeneratorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRandomPasswordIsNotNil() {
        let randomPassword = SecurePassword(length: 12)
        XCTAssert(randomPassword.password != nil)
    }
    
    func testRandomGenerationLength() {
        let randomPassword = SecurePassword(length: 12)
        XCTAssert(randomPassword.password.characters.count == 12)
        
    }
    
    func testTwoRandomPasswordsAreNotEqual() {
        let randomOne = SecurePassword(length: 12)
        let randomTwo = SecurePassword(length: 12)
        XCTAssert(randomOne.password != randomTwo.password)
    }
    
}
