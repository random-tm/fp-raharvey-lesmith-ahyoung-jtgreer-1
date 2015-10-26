//
//  PasswordGeneratorTests.swift
//  PasswordGeneratorTests
//
//  Created by admin on 10/19/15.
//  Copyright © 2015 Rachel Harvey. All rights reserved.
//

import XCTest
@testable import PasswordGenerator

class RandomPasswordTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    func testRandomPasswordIsNotNil() {
        let password = SecurePassword(length: 12)
        XCTAssert(password.getRandomPassword() != nil)
    }
    
    func testRandomGenerationLength() {
        let password = SecurePassword(length: 12)
        XCTAssert(password.getRandomPassword().characters.count == 12)
        
    }
    
    func testTwoRandomPasswordsAreNotEqual() {
        let passwordOne = SecurePassword(length: 12)
        let passwordTwo = SecurePassword(length: 12)
        XCTAssert(passwordOne.getRandomPassword() != passwordTwo.password)
    }
    
}
