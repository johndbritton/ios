//
//  ViewController.swift
//  FirstApp
//
//  Created by John Britton on 9/28/15.
//  Copyright © 2015 John Britton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var helloLabel: UILabel!
    @IBOutlet var toggle: UISwitch!
    
    var isOn: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let value = isOn else { return }
        toggle.on = value
        toggleColor()
    }

    @IBAction func sayHello() {
        helloLabel.text = "Hello"
    }
    
    @IBAction func toggleColor(){
        if toggle.on == true {
            helloLabel.textColor = UIColor.blackColor()
        } else {
            helloLabel.textColor = UIColor.redColor()
        }
    }
}

