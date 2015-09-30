//
//  MapViewController.swift
//  Container
//
//  Created by John Britton on 9/28/15.
//  Copyright © 2015 John Britton. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let center = CLLocationCoordinate2D(latitude: 41.38506, longitude: 2.17340)
        let region = MKCoordinateRegionMakeWithDistance(center, 3000, 3000)
        mapView.setRegion(region, animated: true)
        
        let annotation = Annotation(coordinate: center)
        annotation.title = "Barcelona"
        annotation.subtitle = "Spain"
        mapView.showsScale = true
        mapView.showsCompass = true
        mapView.showsTraffic = true
        
        mapView.addAnnotation(annotation)
    }

    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier("com.example.annotation") as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "com.example.annotation")
        }

        annotationView?.pinTintColor = UIColor.yellowColor()
        annotationView?.animatesDrop = true
        
        return annotationView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
