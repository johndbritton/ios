//
//  MapViewController.swift
//  Earthquakes
//
//  Created by John Britton on 10/2/15.
//  Copyright © 2015 John Britton. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    var geoInfo: GeoInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let geo = geoInfo {
            let center = CLLocationCoordinate2D(latitude: geo.latitude, longitude: geo.longitude)
            let region = MKCoordinateRegionMakeWithDistance(center, 3_000_000, 3_000_000)
            mapView.setRegion(region, animated: true)
            
            let annotation = Annotation(coordinate: center)
            annotation.title = geo.mainInfo?.title
            if let magnitude = geo.mainInfo?.magnitude {
                annotation.subtitle = "Magnitude: \(String(magnitude))"
            }
            mapView.showsScale = true
            mapView.showsCompass = true
            mapView.showsTraffic = true
            
            mapView.addAnnotation(annotation)
        }
        
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
