//
//  ViewController.swift
//  TableView
//
//  Created by John Britton on 9/29/15.
//  Copyright © 2015 John Britton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var dataList: [Int] = {
        var tempArray = [Int](count: 100, repeatedValue: 0)
        for i in 0..<100 {
            tempArray[i] = i
        }
        return tempArray
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "example.tableview.cell")
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("example.tableview.cell", forIndexPath: indexPath) as! TableViewCell
        
        cell.landscapeLabel.text = "\(dataList[indexPath.row]) Cell"
        
        if let image = UIImage(named: "3.jpg") {
            cell.landscapeImageView.image = image
        }

        return cell
    }
    

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        dataList.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
    }
    
}

