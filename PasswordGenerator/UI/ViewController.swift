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
    @IBOutlet private weak var passwordLengthInput: LengthInputTextField!
    private var passwordLength: Int = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.passwordLengthInput.delegate = self
        configurePasswordLabels()
    }
    
    private func configurePasswordLabels() -> Void {
        self.generatedPasswordLabel.text = " "
        self.labelDenotingGeneratedPassword.hidden = true
    }
    
    @IBAction func copyButtonPushed() -> Void {
        let stringToCopy = self.generatedPasswordLabel.text
        if(stringIsCopyable(stringToCopy!)) {
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
        alertController = addAlertControllerAction(alertController, isErrorAlert: false)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    private func createAlertController(title:String, message:String) -> UIAlertController {
        let style = UIAlertControllerStyle.Alert
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        return alertController
    }
    
    private func addAlertControllerAction(alertController: UIAlertController, isErrorAlert: Bool) -> UIAlertController {
        let handler = handlerForType(isErrorAlert: isErrorAlert)
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
        generatePasswordIfAble(isSecure: true)
    }
    
    @IBAction private func memorableButtonPushed() -> Void {
        generatePasswordIfAble(isSecure: false)
    }
    
    private func generatePasswordIfAble(isSecure isSecure: Bool) -> Void {
        if(self.passwordLengthInput.numberIsValid() && lengthIsWithinLimits(self.passwordLengthInput.number())) {
            updateUI()
            generatePassword(isSecure: isSecure)
        } else {
            highlightNumberLimits()
        }
    }
    
    private func lengthIsWithinLimits(length: Int) -> Bool {
        if 11 < length && length < 25 {
            self.passwordLength = length
            return true
        } else {
            return false
        }
    }
    
    private func updateUI() -> Void {
        self.passwordLengthInput.resignFirstResponder()
        showCopyButtonAndPasswordLabel()
        unhighlightNumberLimits()
    }
    
    private func generatePassword(isSecure isSecure: Bool) -> Void {
        if(isSecure) {
            generateSecurePassword()
        } else {
            generateMemorablePassword()
        }
    }
    
    private func generateSecurePassword() -> Void {
        let secureGenerator = SecurePasswordFactory(length: self.passwordLength)
        self.generatedPasswordLabel.text = secureGenerator.getRandomPassword()
    }
    
    private func generateMemorablePassword() -> Void {
        let memorableGenerator = MemorablePasswordFactory(length: self.passwordLength, wordGenerator: RandomWordFactory())
        checkForNetworkError(memorableGenerator.getRandomWords(), memorableGenerator: memorableGenerator)
    }
    
    private func showCopyButtonAndPasswordLabel() -> Void {
        self.copyButton.showButton()
        self.labelDenotingGeneratedPassword.hidden = false
    }
    
    private func highlightNumberLimits() -> Void {
        self.passwordLengthLabel.attributedText = highlightPasswordLengthLabel()
    }
    
    private func unhighlightNumberLimits() -> Void {
        self.passwordLengthLabel.text = self.passwordLengthLabel.text!
    }
    
    private func highlightPasswordLengthLabel() -> NSAttributedString {
        let passwordLengthLabelText: NSString = self.passwordLengthLabel.text!
        return turnPasswordLengthLabelRed(passwordLengthLabelText)
    }
    
    private func turnPasswordLengthLabelRed(passwordLabelString: NSString) -> NSAttributedString {
        let passwordLengthLabel = NSMutableAttributedString(string: passwordLabelString as String)
        let redColor = UIColor.redColor()
        let passwordLabelText = passwordLabelString.rangeOfString("(12-24)")
        passwordLengthLabel.addAttribute(NSForegroundColorAttributeName, value: redColor, range: passwordLabelText)
        return passwordLengthLabel
    }
    
    private func checkForNetworkError(password: String, memorableGenerator: MemorablePasswordFactory) -> Void {
        if(memorableGenerator.checkForNetworkError()) {
            presentErrorAlert()
        } else {
            self.generatedPasswordLabel.text = password
        }
    }
    
    private func presentErrorAlert() -> Void {
        var alertController = createAlertController("Error", message: "Sorry, there was an error fetching your password!")
        alertController = addAlertControllerAction(alertController, isErrorAlert: true)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @objc func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool
    {
        let currentString: NSString = self.passwordLengthInput.text!
        let newString: NSString =
        currentString.stringByReplacingCharactersInRange(range, withString: string)
        return lengthIsThanOrEqualToTwo(newString)
    }
    
    private func lengthIsThanOrEqualToTwo(text: NSString) -> Bool{
        if(text.length <= 2){
            return true
        } else {
            return false
        }
    }
    
}

