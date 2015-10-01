//
//  MyCustomView.swift
//  Painter
//
//  Created by John Britton on 9/30/15.
//  Copyright © 2015 John Britton. All rights reserved.
//

import UIKit

@IBDesignable
class MyCustomView: UIView {
    
    @IBInspectable var strokeStart: CGFloat = 0
    @IBInspectable var lineColor: UIColor = UIColor.blackColor()

    override func drawRect(rect: CGRect) {

        let lineWidth: CGFloat = 6.0

        let newRect = CGRect(x: rect.origin.x+lineWidth, y: rect.origin.y+lineWidth, width: rect.width-2*lineWidth, height: rect.height-2*lineWidth)
        
        let bezierPath = UIBezierPath(ovalInRect: newRect)
        
        let circle = CAShapeLayer()
        circle.path = bezierPath.CGPath
        circle.lineWidth = 2.0
        circle.fillColor = UIColor.clearColor().CGColor
        circle.strokeColor = lineColor.CGColor
        circle.strokeStart = strokeStart / CGFloat(10.0)
        circle.strokeEnd = 1
        
        layer.addSublayer(circle)
    }
}
