//
//  ViewController.swift
//  WhereAmI
//
//  Created by John Britton on 9/30/15.
//  Copyright © 2015 John Britton. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    lazy var locationManager: CLLocationManager = { [unowned self] in
        let locManager = CLLocationManager()
        locManager.delegate = self
        return locManager
    }()
    
    @IBOutlet var startButton: UIBarButtonItem!
    @IBOutlet var locationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.enabled = false

        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case CLAuthorizationStatus.NotDetermined, CLAuthorizationStatus.Restricted, CLAuthorizationStatus.Denied:
            locationManager.requestWhenInUseAuthorization()
        case CLAuthorizationStatus.AuthorizedWhenInUse:
            startButton.enabled = true
        default:
            break
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case CLAuthorizationStatus.NotDetermined, CLAuthorizationStatus.Restricted:
            manager.requestWhenInUseAuthorization()
        case CLAuthorizationStatus.AuthorizedWhenInUse:
            startButton.enabled = true
        default:
            break
        }
    }

    @IBAction func start() {
        locationManager.startUpdatingLocation()
        NSLog("Start")
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        manager.stopUpdatingLocation()
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            guard let geocoderError = error else {
                if let marks = placemarks {
                    let placemark = marks[0]
                    
                    guard let country = placemark.country else { return }
                    guard let address = placemark.addressDictionary else { return }
                    guard let street = address["Street"] else { return }
                    guard let locality = placemark.locality else { return }
                    let information = "\(street)\n\(locality) \(country)"

                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.locationLabel.text = information
                    })
                }

                return
            }
            fatalError("\(geocoderError), \(geocoderError.localizedDescription)")
        }
    }
}

