//
//  MainInfo+CoreDataProperties.swift
//  Earthquakes
//
//  Created by John Britton on 10/1/15.
//  Copyright © 2015 John Britton. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension MainInfo {

    @NSManaged var title: String?
    @NSManaged var magnitude: Float
    @NSManaged var date: NSTimeInterval
    @NSManaged var depth: Float
    @NSManaged var geoInfo: GeoInfo?

}
