//
//  WordProtocol.swift
//  PasswordGenerator
//
//  Created by user113999 on 11/16/15.
//  Copyright © 2015 Rachel Harvey. All rights reserved.
//

import Foundation

protocol WordProtocol {
    
    func getRandomWord(maxLength: Int, minLength: Int) -> String
    
}