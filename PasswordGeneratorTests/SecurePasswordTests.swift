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
        for length in 12...24 {
            let password = SecurePasswordFactory(length: length)
            XCTAssert(password.getRandomPassword() != nil)
        }
    }
    
    func testSecureGenerationLength() {
        for length in 12...24 {
            let password = SecurePasswordFactory(length: length)
            XCTAssert(password.getRandomPassword().characters.count == length)
        }
    }
    
}
