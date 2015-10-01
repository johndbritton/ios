//
//  GeoInfo+CoreDataProperties.swift
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

extension GeoInfo {

    @NSManaged var latitude: Double
    @NSManaged var longitude: Double
    @NSManaged var location: String?
    @NSManaged var mainInfo: MainInfo?
    @NSManaged var webInfo: WebInfo?

}
