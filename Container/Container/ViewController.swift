//
//  ViewController.swift
//  Container
//
//  Created by John Britton on 9/28/15.
//  Copyright © 2015 John Britton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let mapVC = MapViewController(nibName: "MapViewController", bundle: nil)
        let tableVC = TableViewController(nibName: "TableViewController", bundle: nil)
        let sliderVC = SliderViewController(nibName: "SliderViewController", bundle: nil)
        
        addChildViewController(mapVC)
        addChildViewController(tableVC)
        addChildViewController(sliderVC)
        
        view.addSubview(mapVC.view)
        addConstraintsToMapView(mapVC.view)
        
        view.addSubview(tableVC.view)
        addConstraintsToTableView(tableVC.view)

        view.addSubview(sliderVC.view)
        addConstraintsToSliderView(sliderVC.view)
        
        mapVC.didMoveToParentViewController(self)
        tableVC.didMoveToParentViewController(self)
        sliderVC.didMoveToParentViewController(self)
    }
    
    func addConstraintsToMapView(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.topAnchor.constraintEqualToAnchor(self.view.topAnchor).active = true
        view.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        view.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor).active = true
        view.bottomAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
    }
    
    func addConstraintsToTableView(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0).active = true

    }
    
    func addConstraintsToSliderView(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0).active = true

    }
}

