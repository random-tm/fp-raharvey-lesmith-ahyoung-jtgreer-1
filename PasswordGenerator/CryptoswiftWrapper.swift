//
//  CryptoswiftWrapper.swift
//  PasswordGenerator
//
//  Created by Lucas Smith on 11/16/15.
//  Copyright © 2015 Rachel Harvey. All rights reserved.
//

import Foundation
import CryptoSwift

class CryptoswiftWrapper{
    
    private let length:Int
    
    init(length : Int){
        self.length = length
    }
    
    func getPassword() -> String{
        let rawData = getDate()
        let password = rawData.sha512()
        return trimPassword(password)
    }
    
    private func getDate() -> String{
        let date = NSDate()
        let formatter = NSDateFormatter()
        return formatDate(date, formatter: formatter);
    }
    
    private func formatDate(date:NSDate, formatter:NSDateFormatter) -> String{
        formatter.timeStyle = .FullStyle
        let data = formatter.stringFromDate(date)
        return data
    }
    
    private func trimPassword(password:String) -> String{
        let trimIndex = password.startIndex.advancedBy(length)
        return password.substringToIndex(trimIndex)
    }
    
}