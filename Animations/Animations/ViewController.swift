//
//  ViewController.swift
//  Animations
//
//  Created by John Britton on 9/30/15.
//  Copyright © 2015 John Britton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var greenView: UIView!
    @IBOutlet var orangeView: UIView!

    @IBOutlet var topConstraint: NSLayoutConstraint!
    @IBOutlet var leftConstraint: NSLayoutConstraint!
    
    lazy var animator: UIDynamicAnimator = { [unowned self] in
        return UIDynamicAnimator(referenceView: self.view)
    }()
    
    let redLayer: CALayer = CALayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gravity = UIGravityBehavior(items: [greenView, orangeView])
//        gravity.gravityDirection = CGVector(dx: 1, dy: 0)
        animator.addBehavior(gravity)

        
        let collision = UICollisionBehavior(items: [greenView, orangeView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        let dynamicItem = UIDynamicItemBehavior(items: [greenView, orangeView])
        dynamicItem.elasticity = 1
        
        animator.addBehavior(dynamicItem)
    }
    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//
//        var identity = CATransform3DIdentity
//        identity.m34 = -1.0 / 600
//        view.layer.sublayerTransform = identity
//        
//        redLayer.position = CGPoint(x: 100, y: 100)
//        redLayer.bounds = CGRect(x: 0, y: 0, width: 120, height: 60)
//
//        redLayer.backgroundColor = UIColor.redColor().CGColor
//        
//        redLayer.borderColor = UIColor.blueColor().CGColor
//        redLayer.borderWidth = 4.0
//        redLayer.cornerRadius = 8.0
//
//        redLayer.shadowColor = UIColor.blackColor().CGColor
//        redLayer.shadowOffset = CGSizeZero
//        redLayer.shadowOpacity = 0.8
//        redLayer.shadowRadius = 5.0
//        
//        redLayer.transform = CATransform3DMakeRotation(CGFloat(M_PI/6), 0, 1, 0)
//
//        if let image = UIImage(named: "1.jpg") {
//            redLayer.contents = image.CGImage
//        }
//
//        view.layer.addSublayer(redLayer)
//    }

    // MARK: - Animations
    @IBAction func startAnimation() {
//        CATransaction.begin()
//          CATransaction.setAnimationDuration(2.0)
//          CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
//          redLayer.shadowColor = UIColor.redColor().CGColor
//          redLayer.transform = CATransform3DMakeRotation(CGFloat(-M_PI/6), 0, 1, 0)
//          redLayer.backgroundColor = UIColor.greenColor().CGColor
//          redLayer.position = CGPoint(x: 200, y: 400)
//          redLayer.bounds = CGRect(x: 0, y: 0, width: 250, height: 150)
//        CATransaction.commit()
        
//        let animation1 = CABasicAnimation(keyPath: "position")
//        animation1.fromValue = NSValue(CGPoint: CGPoint(x: 100, y: 100))
//        animation1.toValue = NSValue(CGPoint: CGPoint(x: 300, y: 200))
//        animation1.duration = 2.0
//        animation1.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        redLayer.addAnimation(animation1, forKey: nil)
//        CATransaction.begin()
//        CATransaction.setDisableActions(true)
//        redLayer.position = CGPoint(x: 300, y: 200)
//        CATransaction.commit()

//        let animation2 = CAKeyframeAnimation(keyPath: "position")
//        animation2.values = [NSValue(CGPoint: CGPoint(x: 100, y: 100)), NSValue(CGPoint: CGPoint(x: 300, y: 200)), NSValue(CGPoint: CGPoint(x: 100, y: 200))]
//        animation2.keyTimes = [0, 0.5, 1.0]
//        animation2.duration = 2.0
//        animation2.autoreverses = true
//        animation2.repeatCount = 10
//        redLayer.addAnimation(animation2, forKey: nil)
//        CATransaction.begin()
//        CATransaction.setDisableActions(true)
//        redLayer.position = CGPoint(x: 100, y: 100)
//        CATransaction.commit()
        
//        UIView.animateWithDuration(2.0) { () -> Void in
//            self.greenView.frame = CGRect(x: 100, y: 200, width: self.greenView.frame.width, height: self.greenView.frame.height)
//        }
        
        view.layoutIfNeeded()
        
        UIView.animateWithDuration(3.0, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 25, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
//                self.greenView.frame = CGRect(x: 100, y: 200, width: self.greenView.frame.width, height: self.greenView.frame.height)
                self.topConstraint.constant = 200
                self.leftConstraint.constant = 100
                self.view.layoutIfNeeded()
            }, completion: nil)
    }

}

