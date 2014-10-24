//
//  LoginViewController.swift
//  Tumbler
//
//  Created by Mel Ludowise on 10/24/14.
//  Copyright (c) 2014 Mel Ludowise. All rights reserved.
//

import UIKit

class LoginViewController: FadeInViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidAppear(animated: Bool) {
        emailField.becomeFirstResponder()
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (textField == emailField) {
            passwordField.becomeFirstResponder()
        } else if (textField == passwordField) {
            login()
        } else {
            return false
        }
        return true
    }
    
    private func login() {
        activityIndicator.startAnimating()
        delay(2, { () -> () in
            self.activityIndicator.stopAnimating()
            self.dismissViewControllerAnimated(true, completion: nil)
        })
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        loginButton.enabled = emailField.text != "" && passwordField.text != ""
    }
    
    @IBAction func onLoginButton(sender: AnyObject) {
        login()
    }
    
    @IBAction func onCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
