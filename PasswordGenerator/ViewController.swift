//
//  ViewController.swift
//  PasswordGenerator
//
//  Created by admin on 10/19/15.
//  Copyright © 2015 Rachel Harvey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var labelDenotingGeneratedPassword: UILabel!
    @IBOutlet weak private var generatedPasswordLabel: UILabel!
    @IBOutlet weak private var secureButton: UIButton!
    @IBOutlet weak private var memorableButton: UIButton!
    
    private var passwordWasGenerated = false
    private let longPressRecognizer = UILongPressGestureRecognizer()
    private var passwordLength: Int = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.generatedPasswordLabel.text = " "
        self.longPressRecognizer.addTarget(self, action: "longPressed")
        self.generatedPasswordLabel.addGestureRecognizer(longPressRecognizer)
        self.generatedPasswordLabel.userInteractionEnabled = true
        
        self.labelDenotingGeneratedPassword.hidden = true
        
        self.secureButton.layer.borderColor = UIColor.greenColor().CGColor
        self.secureButton.layer.borderWidth = 0.5
        self.memorableButton.layer.borderColor = UIColor.greenColor().CGColor
        self.memorableButton.layer.borderWidth = 0.5
        
    }
    
    @IBAction private func secureButtonPushed() {
        generatedPassword()
        let secure = SecurePassword(length: self.passwordLength)
        self.generatedPasswordLabel.text = secure.getRandomPassword()
    }
    
    @IBAction private func memorableButtonPushed() {
        generatedPassword()
        let memorable = MemorablePassword(length: self.passwordLength)
        self.generatedPasswordLabel.text = memorable.getRandomWord()
    }
    
    private func longPressed() {
        if self.longPressRecognizer.state == .Began {
            let stringToCopy = self.generatedPasswordLabel.text
            if stringToCopy != " " && stringToCopy != nil {
                let pasteBoard = UIPasteboard.generalPasteboard()
                pasteBoard.string = stringToCopy
                presentCopiedAlert()
            }
        }
    }
    
    private func presentCopiedAlert() {
        let alertController = UIAlertController(title: "Copied", message:
            "Copied Password to Clipboard!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    private func generatedPassword() {
        self.passwordWasGenerated = true
        self.labelDenotingGeneratedPassword.hidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

