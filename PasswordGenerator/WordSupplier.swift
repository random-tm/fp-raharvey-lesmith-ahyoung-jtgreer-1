//
//  WordSupplier.swift
//  PasswordGenerator
//
//  Created by Aaron Young on 11/16/15.
//  Copyright © 2015 Rachel Harvey, Lucas Smith, Aaron Young, and Jeffery Greer. All rights reserved.
//

import Foundation

protocol WordSupplier {
    
    func getRandomWord(maxLength: Int, minLength: Int) -> String
    
}