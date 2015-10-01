//
//  ViewController.swift
//  Earthquakes
//
//  Created by John Britton on 10/1/15.
//  Copyright © 2015 John Britton. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var globalMoc: NSManagedObjectContext?
    var mainMoc: NSManagedObjectContext?
    
    var dataList: [MainInfo] = [MainInfo]()
    
    @IBOutlet var tableView: UITableView!

    private let urlString: String = "http://earthquake-report.com/feeds/recent-eq?json"

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "com.example.cell")
        updateData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedMainInfo = dataList[indexPath.row]
        if let geoInfo = selectedMainInfo.geoInfo {
            let mapVC = MapViewController(nibName: "MapViewController", bundle: nil)
            mapVC.geoInfo = geoInfo
            showViewController(mapVC, sender: nil)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("com.example.cell", forIndexPath: indexPath)
        
        if let title = dataList[indexPath.row].title {
            cell.textLabel?.text = title
        }
        
        return cell
    }
    
    @IBAction func updateData() {
        deleteData()
        
        let urlSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        guard let url = NSURL(string: urlString) else { return }
        let urlRequest = NSURLRequest(URL: url)
        let dataTask = urlSession.dataTaskWithRequest(urlRequest) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if error == nil {
                guard let jsonData = data else { return }
                
                do {
                    guard let jsonArray = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as? [AnyObject] else { return }
                    
                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssvvvv"
                    
                    guard let managedObjectContext = self.globalMoc else { fatalError("There is no MOC") }

                    managedObjectContext.performBlock() {
                        for element in jsonArray {
                            guard let
                                title = element["title"] as? String,
                                magnitude = element["magnitude"] as? NSString,
                                latitude = element["latitude"] as? NSString,
                                longitude = element["longitude"] as? NSString,
                                location = element["location"] as? String,
                                depth = element["depth"] as? NSString,
                                link = element["link"] as? String,
                                date_time = element["date_time"] as? String,
                                date = dateFormatter.dateFromString(date_time)
                            else { return }

                            let mainInfo = NSEntityDescription.insertNewObjectForEntityForName("MainInfo", inManagedObjectContext: managedObjectContext) as! MainInfo
                            
                            mainInfo.title = title
                            mainInfo.date = date.timeIntervalSinceReferenceDate
                            mainInfo.depth = depth.floatValue
                            mainInfo.magnitude = magnitude.floatValue
                            
                            let geoInfo = NSEntityDescription.insertNewObjectForEntityForName("GeoInfo", inManagedObjectContext:
                            managedObjectContext) as! GeoInfo
                            
                            geoInfo.latitude = latitude.doubleValue
                            geoInfo.longitude = longitude.doubleValue
                            geoInfo.location = location
                            
                            let webInfo = NSEntityDescription.insertNewObjectForEntityForName("WebInfo", inManagedObjectContext: managedObjectContext) as! WebInfo
                            
                            webInfo.link = link
                            
                            mainInfo.geoInfo = geoInfo
                            geoInfo.webInfo = webInfo
                        }

                        do {
                            try managedObjectContext.save()
                            self.fetchData()
                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                self.tableView.reloadData()
                            })
                        } catch {
                            fatalError("\(error)")
                        }
                    }
                } catch {
                    fatalError("\(error)")
                }
                
            } else {
                fatalError("\(error!), \(error!.localizedDescription)")
            }
        }
        dataTask.resume()
    }
    
    func deleteData() {
        guard let managedObjectContext = self.globalMoc else { return }

        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = NSEntityDescription.entityForName("MainInfo", inManagedObjectContext: managedObjectContext)
        
        do {
            if let results = try managedObjectContext.executeFetchRequest(fetchRequest) as? [MainInfo] {
                managedObjectContext.performBlockAndWait() {
                    for element in results {
                        managedObjectContext.deleteObject(element)
                    }
                    do {
                        try managedObjectContext.save()
                    } catch {
                        fatalError("\(error)")
                    }
                }
            }
        } catch {
            fatalError("\(error)")
        }
    }
    
    func fetchData() {
        guard let managedObjectContext = self.mainMoc else { return }
        
        managedObjectContext.performBlockAndWait { () -> Void in
            let fetchRequest = NSFetchRequest()
            fetchRequest.entity = NSEntityDescription.entityForName("MainInfo", inManagedObjectContext: managedObjectContext)
            
            let magnitudeSortDescriptor = NSSortDescriptor(key: "magnitude", ascending: false)
            let dateSortDescriptor = NSSortDescriptor(key: "date", ascending: true)
            let titleSortDescriptor = NSSortDescriptor(key: "title", ascending: true)
            
            fetchRequest.sortDescriptors = [magnitudeSortDescriptor, dateSortDescriptor, titleSortDescriptor]
            
            do {
                if let results = try managedObjectContext.executeFetchRequest(fetchRequest) as? [MainInfo] {
                    self.dataList = results
                }
            } catch {
                fatalError()
            }
        }
    }

}

