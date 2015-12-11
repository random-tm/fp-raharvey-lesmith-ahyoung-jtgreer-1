//
//  CopyButton.swift
//  PasswordGenerator
//
//  Created by admin on 12/4/15.
//  Copyright © 2015 Rachel Harvey. All rights reserved.
//

import Foundation
import UIKit

class CopyButton: BorderedButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        hideButton()
    }
    
    func showButton() {
        self.enabled = true
        self.hidden = false
    }
    
    func hideButton() {
        self.enabled = false
        self.hidden = true
    }
}