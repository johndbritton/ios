//
//  ViewController.swift
//  GCD
//
//  Created by John Britton on 9/29/15.
//  Copyright © 2015 John Britton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let queue = dispatch_queue_create("com.example.queue", DISPATCH_QUEUE_CONCURRENT)
        for i in 0 ..< 10000 {
            dispatch_async(queue) { () -> Void in
                NSLog("Closure 1: \(i)")
            }
        }

        dispatch_async(queue) { () -> Void in
            NSLog("Closure 2")
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.view.backgroundColor = UIColor.redColor();
            })
        }
        
        for i in 0 ..< 10000 {
            dispatch_async(queue) { () -> Void in
                NSLog("Closure 3: \(i)")
            }
        }

        NSLog("Done.")
    }
}

