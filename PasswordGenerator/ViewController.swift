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
    
    private let longPressRecognizer = UILongPressGestureRecognizer()
    private var passwordLength: Int = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureGeneratedPasswordLabel()
        self.labelDenotingGeneratedPassword.hidden = true
        self.addButtonBorders()
    }
    
    private func configureGeneratedPasswordLabel() {
        self.generatedPasswordLabel.text = " "
        self.longPressRecognizer.addTarget(self, action: "longPressed")
        self.generatedPasswordLabel.addGestureRecognizer(longPressRecognizer)
        self.generatedPasswordLabel.userInteractionEnabled = true
    }
    
    private func addButtonBorders() {
        self.secureButton.layer.borderColor = UIColor.greenColor().CGColor
        self.secureButton.layer.borderWidth = 0.5
        self.memorableButton.layer.borderColor = UIColor.greenColor().CGColor
        self.memorableButton.layer.borderWidth = 0.5
    }
    
    func longPressed() {
        if(self.notCopying()) {
            self.copyPassword()
        }
    }
    
    func notCopying() -> Bool {
        return self.longPressRecognizer.state == .Began
    }
    
    private func copyPassword() {
        let stringToCopy = self.generatedPasswordLabel.text
        if(self.stringIsCopyable(stringToCopy!)) {
            let pasteBoard = UIPasteboard.generalPasteboard()
            pasteBoard.string = stringToCopy
            presentCopiedAlert()
        }
    }
    
    private func stringIsCopyable(password: String!) -> Bool {
        let isNotEmpty = password != " "
        let isNotNil = password != nil
        return isNotEmpty && isNotNil
    }
    
    private func presentCopiedAlert() {
        let alertController = UIAlertController(title: "Copied", message:
            "Copied Password to Clipboard!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction private func secureButtonPushed() {
        self.labelDenotingGeneratedPassword.hidden = false
        let secure = SecurePassword(length: self.passwordLength)
        self.generatedPasswordLabel.text = secure.getRandomPassword()
    }
    
    @IBAction private func memorableButtonPushed() {
        self.labelDenotingGeneratedPassword.hidden = false
        let memorable = MemorablePassword(length: self.passwordLength)
        self.generatedPasswordLabel.text = memorable.getRandomWords()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

