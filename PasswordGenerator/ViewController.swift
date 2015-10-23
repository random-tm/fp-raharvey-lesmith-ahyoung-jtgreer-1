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
    @IBOutlet weak var secureButton: UIButton!
    @IBOutlet weak var memorableButton: UIButton!
    
    let longPressRecognizer = UILongPressGestureRecognizer()
    var passwordLength: Int = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.generatedPasswordLabel.text = " "
        self.longPressRecognizer.addTarget(self, action: "longPressed")
        self.generatedPasswordLabel.addGestureRecognizer(longPressRecognizer)
        self.generatedPasswordLabel.userInteractionEnabled = true
        
        self.secureButton.layer.borderColor = UIColor.greenColor().CGColor
        self.secureButton.layer.borderWidth = 0.5
        self.memorableButton.layer.borderColor = UIColor.greenColor().CGColor
        self.memorableButton.layer.borderWidth = 0.5
        
    }
    
    @IBAction func secureButtonPushed() {
        let secure = SecurePassword(length: self.passwordLength)
        self.generatedPasswordLabel.text = secure.password
    }
    
    @IBAction func memorableButtonPushed() {
        let memorable = MemorablePassword(length: self.passwordLength)
        self.generatedPasswordLabel.text = memorable.password
    }
    
    func longPressed() {
        if self.longPressRecognizer.state == .Began {
            let stringToCopy = self.generatedPasswordLabel.text
            if stringToCopy != " " && stringToCopy != nil {
                let pasteBoard = UIPasteboard.generalPasteboard()
                pasteBoard.string = stringToCopy
                presentCopiedAlert()
            }
        }
    }
    
    func presentCopiedAlert() {
        let alertController = UIAlertController(title: "Copied", message:
            "Copied Password to Clipboard!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

