//
//  ViewController.swift
//  PasswordGenerator
//
//  Created by admin on 10/19/15.
//  Copyright © 2015 Rachel Harvey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var generatedPasswordLabel: UILabel!
    let longPressRecognizer = UILongPressGestureRecognizer()
    var passwordLength: Int = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.generatedPasswordLabel.text = " "
        self.longPressRecognizer.addTarget(self, action: "longPressedView")
        self.generatedPasswordLabel.addGestureRecognizer(longPressRecognizer)
        self.generatedPasswordLabel.userInteractionEnabled = true
    }
    
    @IBAction func secureButtonPushed() {
        let secure = SecurePassword(length: self.passwordLength)
        self.generatedPasswordLabel.text = secure.password
    }
    
    @IBAction func memorableButtonPushed() {
        let memorable = MemorablePassword(length: self.passwordLength)
        self.generatedPasswordLabel.text = memorable.password
    }
    
    func longPressedView() {
        print("long press gesture recognized")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

