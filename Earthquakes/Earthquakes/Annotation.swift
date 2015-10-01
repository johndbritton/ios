//
//  Annotation.swift
//  Earthquakes
//
//  Created by John Britton on 10/2/15.
//  Copyright © 2015 John Britton. All rights reserved.
//

import MapKit

class Annotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        super.init()
    }
}