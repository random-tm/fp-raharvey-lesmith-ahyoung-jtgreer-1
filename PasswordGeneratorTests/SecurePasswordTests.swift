//
//  PasswordGeneratorTests.swift
//  PasswordGeneratorTests
//
//  Created by Rachel Harvey on 10/19/15.
//  Copyright © 2015 Rachel Harvey, Lucas Smith, Aaron Young, and Jeffery Greer. All rights reserved.
//

import XCTest
@testable import PasswordGenerator

class SecurePasswordTests: XCTestCase {
    
    func testSecurePasswordIsNotNil() {
        let password = SecurePassword(length: 12)
        XCTAssert(password.getRandomPassword() != nil)
    }
    
    func testSecureGenerationLength() {
        let password = SecurePassword(length: 12)
        XCTAssert(password.getRandomPassword().characters.count == 12)
    }
    
}
