//
//  ViewController.swift
//  Navigation2
//
//  Created by John Britton on 9/28/15.
//  Copyright © 2015 John Britton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let nextButton = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.Plain, target: self, action: "goNext")
        navigationItem.rightBarButtonItem = nextButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func goNext() {
        let vc = SecondViewController(nibName: "SecondViewController", bundle: nil)
        showViewController(vc, sender: nil)
    }
}

