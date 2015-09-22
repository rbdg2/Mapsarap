//
//  ViewController.swift
//  Mapsarap
//
//  Created by RB de Guzman on 9/17/15.
//  Copyright (c) 2015 RB de Guzman. All rights reserved.
//

import UIKit
import GoogleMaps

class GMSMapViewCommands : NSObject {
    let functions = "GMSMapView Functions"
    let properties = "GMSMapView Properties"
    
    //Public Member Functions
    let clear = "clear"
    let setMinZoomMaxzoom = "setMinZoom:maxZoom"
    let cameraForBoundsinsets = "cameraForBounds:insets:"
    let moveCamera = "moveCamera"
    let animateToCameraPosition = "animateToCameraPosition:"
    let animateToLocation = "animateToLocation:"
    let animateToZoom = "animateToZoom:"
    let animateToBearing = "animateToBearing:"
    let animateToViewingAngle = "animateToViewingAngle:"
    let animateWithCameraUpdate = "animateWithCameraUpdate:"
    
    //Properties
    let myLocationEnabled = "myLocationEnabled"
    let mapType = "mapType"
    let trafficEnabled = "trafficEnabled"
    let buildingsEnabled = "buildingsEnabled"
    
    func allCommands() -> NSArray {
        return NSArray(array: [clear, setMinZoomMaxzoom, cameraForBoundsinsets, moveCamera, animateToCameraPosition, animateToLocation, animateToZoom, animateToBearing, animateToViewingAngle, animateWithCameraUpdate])
    }
    
    func allProperties() -> NSArray {
        return NSArray(array: [myLocationEnabled, mapType, trafficEnabled, buildingsEnabled])
    }
}

class ViewController: UIViewController, GMSMapViewDelegate, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var mapView: GMSMapView!
    @IBOutlet var tableView: UITableView!
    
    let dataSource = MPDataSource()
    let gmsMapViewCommands = GMSMapViewCommands()
    let reuseIdentifier = "tableCell"
    
    //Action Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if let command : String = cell.textLabel?.text {
                doAction(command)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]

        var 🎁 : String = ""
        println("Hey \(🎁)")

        setupCommands()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }
    
    func setupCommands() {
//        dataSource.addDataWithArrays(["StartOver"], addedDescriptions: [""], atSection: "Debug")
        dataSource.addDataWithArrays(gmsMapViewCommands.allCommands(), addedDescriptions: [""], atSection: gmsMapViewCommands.functions)
        dataSource.addDataWithArrays(gmsMapViewCommands.allProperties(), addedDescriptions: [""], atSection: gmsMapViewCommands.properties)
    }
    
    func mapView(mapView: GMSMapView!, didTapAtCoordinate coordinate: CLLocationCoordinate2D) {
        NSDebug.log("didTapAtCoordinate")
    }
    
    //UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataSource.numberOfSections();
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource.titleForHeaderInSectionNumber(section)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numberOfRowsInSections(section);
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
        
        cell.textLabel?.text = dataSource.commandForRow(indexPath.row, inSection: indexPath.section)
        return cell
    }

}

class NSDebug : NSObject {
    class func log(message : String) {
        println("ViewController: \(message)")
    }
}