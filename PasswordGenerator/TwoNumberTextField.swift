//
//  TwoNumberTextField.swift
//  PasswordGenerator
//
//  Created by admin on 12/8/15.
//  Copyright © 2015 Rachel Harvey. All rights reserved.
//

import Foundation
import UIKit

class TwoNumberTextField: UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.keyboardType = UIKeyboardType.NumberPad
    }
    
}
