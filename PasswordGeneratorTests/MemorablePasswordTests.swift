//
//  MemorablePasswordTests.swift
//  PasswordGenerator
//
//  Created by admin on 10/22/15.
//  Copyright © 2015 Rachel Harvey. All rights reserved.
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
        XCTAssert(password.password != nil)
    }
    
}
