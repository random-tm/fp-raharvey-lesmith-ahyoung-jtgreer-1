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
    @IBOutlet weak private var copyButton: UIButton!
    
    private var passwordLength: Int = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureGeneratedPasswordLabel()
        self.labelDenotingGeneratedPassword.hidden = true
        self.copyButton.enabled = false
        self.copyButton.hidden = true
        self.addButtonBorders()
    }
    
    private func configureGeneratedPasswordLabel() -> Void {
        self.generatedPasswordLabel.text = " "
    }
    
    private func addButtonBorders() -> Void{
        self.secureButton.layer.borderColor = UIColor.greenColor().CGColor
        self.secureButton.layer.borderWidth = 0.5
        self.memorableButton.layer.borderColor = UIColor.greenColor().CGColor
        self.memorableButton.layer.borderWidth = 0.5
        self.copyButton.layer.borderColor = UIColor.greenColor().CGColor
        self.copyButton.layer.borderWidth = 0.5
    }
    
    @IBAction func copyButtonPushed(sender: UIButton) {
        self.copyPassword()
    }
    
    private func copyPassword() -> Void {
        let stringToCopy = self.generatedPasswordLabel.text
        if(self.stringIsCopyable(stringToCopy!)) {
            copyPasswordToClipboard(stringToCopy!)
        }
    }
    
    private func copyPasswordToClipboard(stringToCopy:String) -> Void {
        let pasteBoard = UIPasteboard.generalPasteboard()
        pasteBoard.string = stringToCopy
        presentCopiedAlert()
    }
    
    private func stringIsCopyable(password: String!) -> Bool {
        if((password != nil) && !stringIsEmpty(password)){
            return true
        } else {
            return false
        }
    }
    
    private func stringIsEmpty(string:String) -> Bool{
        if(string == " "){
            return true
        } else {
            return false
        }
    }
    
    private func presentCopiedAlert() -> Void{
        var alertController:UIAlertController = createAlertController("Copied", message: "Copied Password to Clipboard!")
        alertController = addCopyAlertControllerAction("Dismiss", alertController: alertController)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    private func createAlertController(title:String, message:String)->UIAlertController{
        let style = UIAlertControllerStyle.Alert
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        return alertController
    }
    
    private func addCopyAlertControllerAction(title:String, alertController:UIAlertController)->UIAlertController{
        let style = UIAlertActionStyle.Default
        alertController.addAction(UIAlertAction(title: title, style: style, handler: nil))
        return alertController
    }
    
    @IBAction private func secureButtonPushed() -> Void{
        self.copyButton.enabled = true
        self.copyButton.hidden = false
        self.labelDenotingGeneratedPassword.hidden = false
        let secure = SecurePassword(length: self.passwordLength)
        let password = secure.getRandomPassword()
        self.generatedPasswordLabel.text = password
    }
    
    @IBAction private func memorableButtonPushed() -> Void {
        self.copyButton.enabled = true
        self.copyButton.hidden = false
        self.labelDenotingGeneratedPassword.hidden = false
        let memorableGenerator = MemorablePassword(length: self.passwordLength)
        let password = memorableGenerator.getRandomWords()
        self.checkForNetworkError(password, memorableGenerator: memorableGenerator)
    }
    
    private func checkForNetworkError(password:String, memorableGenerator:MemorablePassword) -> Void{
        if(memorableGenerator.checkForPasswordError()) {
            self.presentErrorAlert()
        } else {
            self.generatedPasswordLabel.text = password
        }
    }
    
    private func presentErrorAlert() -> Void {
        var alertController = createAlertController("Error", message: "Sorry, there was an error fetching your password!")
        alertController = addErrorAlertControllerAction("Dismiss", alertController: alertController)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    private func addErrorAlertControllerAction(title:String, alertController:UIAlertController) -> UIAlertController{
        let style = UIAlertActionStyle.Default
        let handler = {(alert: UIAlertAction!) in self.viewDidLoad()}
        alertController.addAction(UIAlertAction(title: title, style: style, handler: handler))
        return alertController
    }

}

