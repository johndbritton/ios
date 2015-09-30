//
//  ViewController.swift
//  Password
//
//  Created by John Britton on 9/29/15.
//  Copyright © 2015 John Britton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoginViewControllerDelegate {
    
    @IBAction func login() {
        let vc = LoginViewController(nibName: "LoginViewController", bundle: nil)
        vc.delegate = self
        presentViewController(vc, animated: true, completion: nil)
    }
    
    func loginViewController(vc: LoginViewController, didFinishWithResults results: [String : String]) {
        if let loginString = results["Login"], let passwordString = results["Password"] {
            NSLog("\(loginString) \(passwordString)")
        }
        dismissViewControllerAnimated(true, completion: nil)
    }

}

