//
//  LoginViewController.swift
//  Password
//
//  Created by John Britton on 9/29/15.
//  Copyright © 2015 John Britton. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate {
    func loginViewController(vc: LoginViewController, didFinishWithResults results: [String:String])
}

class LoginViewController: UIViewController {
    
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    var delegate: LoginViewControllerDelegate?

    @IBAction func done() {
        if let loginString = loginTextField.text, let passwordString = passwordTextField.text {
            delegate?.loginViewController(self, didFinishWithResults: ["Login" :loginString, "Password": passwordString])
        }
    }
}
