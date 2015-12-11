//
//  BorderedButton.swift
//  PasswordGenerator
//
//  Created by admin on 12/3/15.
//  Copyright © 2015 Rachel Harvey, Lucas Smith, Aaron Young, and Jeffery Greer. All rights reserved.
//

import Foundation
import UIKit

class BorderedButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        addBorder()
        adjustLabel()
    }
    
    private func addBorder() -> Void {
        self.layer.borderColor = UIColor.greenColor().CGColor
        self.layer.borderWidth = 0.5
    }
    
    private func adjustLabel() -> Void {
        self.titleLabel!.numberOfLines = 0
        self.titleLabel!.adjustsFontSizeToFitWidth = true
        self.titleLabel!.lineBreakMode = NSLineBreakMode.ByWordWrapping
    }
}
