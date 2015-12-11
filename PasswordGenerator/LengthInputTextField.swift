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
    
    var numberValue: Int = 12
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.keyboardType = UIKeyboardType.NumberPad
    }
    
    func numberIsValid() -> Bool {
        if let number = Int(self.text!) {
            self.numberValue = number
            return true
        } else {
            return false
        }
    }
}
