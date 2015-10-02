//
//  ViewController.swift
//  Gesture
//
//  Created by John Britton on 10/2/15.
//  Copyright © 2015 John Britton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var canvas: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "handleGesture:")
        canvas.addGestureRecognizer(panGestureRecognizer)
    }

    func handleGesture(gesture: UIPanGestureRecognizer){
        switch gesture.state {
        case UIGestureRecognizerState.Possible:
            break
        case UIGestureRecognizerState.Failed:
            break
        case UIGestureRecognizerState.Began:
            changeColor()
        case UIGestureRecognizerState.Changed:
            changeAlpha()
        case UIGestureRecognizerState.Ended:
            resetColor()
        case UIGestureRecognizerState.Cancelled:
            break
        }
    }
    
    func changeColor() {
        let red = CGFloat(arc4random() % 255) / 255.0
        let green = CGFloat(arc4random() % 255) / 255.0
        let blue = CGFloat(arc4random() % 255) / 255.0

        canvas.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 0)
    }

    func resetColor() {
        canvas.backgroundColor = UIColor.whiteColor()
    }

    func changeAlpha() {
        guard let color = canvas.backgroundColor?.CGColor else { return }
        let colors = CGColorGetComponents(color)
        let alpha = colors[3] + 0.005
        canvas.backgroundColor = UIColor(red: colors[0], green: colors[1], blue: colors[2], alpha: alpha)
    }

}

