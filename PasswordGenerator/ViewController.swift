//
//  ViewController.swift
//  PasswordGenerator
//
//  Created by Rachel Harvey on 10/19/15.
//  Copyright © 2015 Rachel Harvey, Lucas Smith, Aaron Young, and Jeffery Greer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak private var labelDenotingGeneratedPassword: UILabel!
    @IBOutlet weak private var generatedPasswordLabel: UILabel!
    
    @IBOutlet weak private var secureButton: BorderedButton!
    @IBOutlet weak private var memorableButton: BorderedButton!
    @IBOutlet weak private var copyButton: CopyButton!
    
    @IBOutlet weak private var whyNavigationButton: BorderedButton!
    @IBOutlet weak private var howNavigationButton: BorderedButton!
    
    @IBOutlet private weak var passwordLengthLabel: UILabel!
    @IBOutlet private weak var passwordLengthInput: TwoNumberTextField!
    private var passwordLength: Int = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurePasswordLabels()
        self.passwordLengthInput.delegate = self
    }
    
    private func configurePasswordLabels() -> Void {
        self.generatedPasswordLabel.text = " "
        self.labelDenotingGeneratedPassword.hidden = true
    }
    
    @IBAction func copyButtonPushed() -> Void {
        let stringToCopy = self.generatedPasswordLabel.text
        if(self.stringIsCopyable(stringToCopy!)) {
            copyPasswordToClipboard()
        }
    }
    
    private func stringIsCopyable(password: String!) -> Bool {
        if((password != nil) && !stringIsEmpty(password)){
            return true
        } else {
            return false
        }
    }
    
    private func stringIsEmpty(string:String) -> Bool {
        if(string == " "){
            return true
        } else {
            return false
        }
    }
    
    private func copyPasswordToClipboard() -> Void {
        let pasteBoard = UIPasteboard.generalPasteboard()
        pasteBoard.string = self.generatedPasswordLabel.text
        presentCopiedAlert()
    }
    
    private func presentCopiedAlert() -> Void {
        var alertController:UIAlertController = createAlertController("Copied", message: "Copied Password to Clipboard!")
        alertController = self.addAlertControllerAction(alertController, isErrorAlert: false)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    private func createAlertController(title:String, message:String) -> UIAlertController {
        let style = UIAlertControllerStyle.Alert
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        return alertController
    }
    
    private func addAlertControllerAction(alertController: UIAlertController, isErrorAlert: Bool) -> UIAlertController {
        let handler = self.handlerForType(isErrorAlert: isErrorAlert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: handler))
        return alertController
    }
    
    private func handlerForType(isErrorAlert isErrorAlert: Bool) -> ((UIAlertAction!) -> ())! {
        var handler: ((UIAlertAction!) -> ())!
        if(isErrorAlert) {
            handler = {(alert: UIAlertAction!) in self.viewDidLoad()}
        } else {
            handler = nil
        }
        return handler
    }
    
    @IBAction private func secureButtonPushed() -> Void {
        if(canSetNewLength() && lengthIsWithinReason()) {
            self.showCopyButtonAndPasswordLabel()
            self.unhighlightNumberLimits()
            let secureGenerator = SecurePasswordFactory(length: self.passwordLength)
            self.generatedPasswordLabel.text = secureGenerator.getRandomPassword()
        } else {
            self.highlightNumberLimits()
        }
    }
    
    @IBAction private func memorableButtonPushed() -> Void {
        if(canSetNewLength() && lengthIsWithinReason()) {
            self.showCopyButtonAndPasswordLabel()
            self.unhighlightNumberLimits()
            let memorableGenerator = MemorablePasswordFactory(length: self.passwordLength, wordGenerator: RandomWordFactory())
            self.checkForNetworkError(memorableGenerator.getRandomWords(), memorableGenerator: memorableGenerator)
        } else {
            self.highlightNumberLimits()
        }
    }
    
    func canSetNewLength() -> Bool {
        if let length = Int(self.passwordLengthInput.text!) {
            self.passwordLength = length
            return true
        } else {
            return false
        }
    }
    
    func lengthIsWithinReason() -> Bool {
        if 11 < self.passwordLength && self.passwordLength < 25 {
            return true
        } else {
            return false
        }
    }
    
    func highlightNumberLimits() {
        let passwordLabelString: NSString = self.passwordLengthLabel.text!
        let mutableLabelString = NSMutableAttributedString(string: passwordLabelString as String)
        mutableLabelString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: passwordLabelString.rangeOfString("(12-24)"))
        self.passwordLengthLabel.attributedText = mutableLabelString
    }
    
    func unhighlightNumberLimits() {
        let passwordLabelString: NSString = self.passwordLengthLabel.text!
        self.passwordLengthLabel.text = passwordLabelString as String
    }
    
    private func showCopyButtonAndPasswordLabel() -> Void {
        self.copyButton.showButton()
        self.labelDenotingGeneratedPassword.hidden = false
    }
    
    private func checkForNetworkError(password:String, memorableGenerator:MemorablePasswordFactory) -> Void {
        if(memorableGenerator.checkForNetworkError()) {
            self.presentErrorAlert()
        } else {
            self.generatedPasswordLabel.text = password
        }
    }
    
    private func presentErrorAlert() -> Void {
        var alertController = createAlertController("Error", message: "Sorry, there was an error fetching your password!")
        alertController = self.addAlertControllerAction(alertController, isErrorAlert: true)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool
    {
        let maxLength = 2
        let currentString: NSString = self.passwordLengthInput.text!
        let newString: NSString =
        currentString.stringByReplacingCharactersInRange(range, withString: string)
        return newString.length <= maxLength
    }
    
}

