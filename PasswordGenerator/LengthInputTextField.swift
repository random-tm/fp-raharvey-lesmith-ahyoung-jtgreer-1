//
//  LengthInputTextField.swift
//  PasswordGenerator
//
//  Created by admin on 12/10/15.
//  Copyright © 2015 Rachel Harvey. All rights reserved.
//

import Foundation
import UIKit

class LengthInputTextField: UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.keyboardType = UIKeyboardType.NumberPad
    }
    
    func number() -> Int! {
        if let number = Int(self.text!) {
            return number
        } else {
            return nil
        }
    }
    
    func numberIsValid() -> Bool {
        if(number() != nil) {
            return true
        } else {
            return false
        }
    }
}
