//
//  ViewControllerCategory.swift
//  Mapsarap
//
//  Created by RB de Guzman on 9/22/15.
//  Copyright (c) 2015 RB de Guzman. All rights reserved.
//

import UIKit
import GoogleMaps

extension ViewController {
    func doAction(command : String) {
        println("Command: \(command)")
        
        switch command {
        case "StartOver":
            mapView.clear()
            mapView.setMinZoom(kGMSMinZoomLevel, maxZoom: kGMSMaxZoomLevel);
            
            break;
            
        case gmsMapViewCommands.clear: clear()
        break;
            
        case gmsMapViewCommands.setMinZoomMaxzoom: setMinZoomMaxzoom()
        break;
            
        case gmsMapViewCommands.cameraForBoundsinsets: cameraForBoundsinsets()
        break;
            
        case gmsMapViewCommands.moveCamera: moveCamera() //Not working
        break;

        case gmsMapViewCommands.animateToCameraPosition: animateToCameraPosition()
        break;

        case gmsMapViewCommands.animateToLocation: animateToLocation()
        break;

        case gmsMapViewCommands.animateToZoom: animateToZoom()
        break;

        case gmsMapViewCommands.animateToBearing: animateToBearing()
        break;

        case gmsMapViewCommands.animateToViewingAngle: animateToViewingAngle()
        break;

        case gmsMapViewCommands.animateWithCameraUpdate: animateWithCameraUpdate() //Not working
        break;

        case gmsMapViewCommands.animateToBearing: animateToBearing()
        break;

        case gmsMapViewCommands.animateToViewingAngle: animateToViewingAngle()
        break;

        case gmsMapViewCommands.myLocationEnabled: myLocationEnabled() //Not working
        break;

        case gmsMapViewCommands.mapType: mapType()
        break;
            
        case gmsMapViewCommands.trafficEnabled: trafficEnabled()
        break;
            
        case gmsMapViewCommands.buildingsEnabled: buildingsEnabled()
        break;
            
        default:
            break;
        }
        
    }

    //GMSMapViewCommands
    func clear() {
        mapView.clear()
    }
    
    func setMinZoomMaxzoom() {
        let alert = UIAlertController(title: gmsMapViewCommands.setMinZoomMaxzoom, message: "This method expects the minimum to be less than or equal to the maximum, and will throw an exception with name NSRangeException otherwise.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .Cancel) { action in
                println("\(action)")
        }
        
        let actionOk = UIAlertAction(title: "OK", style: .Default) {
            action in
            let minTextField = alert.textFields![0] as! UITextField
            let maxTextField = alert.textFields![1] as! UITextField
            let minString : NSString = minTextField.text
            let maxString : NSString = maxTextField.text
            
            self.mapView.setMinZoom(minString.floatValue, maxZoom: maxString.floatValue)
        }
        
        alert.addTextFieldWithConfigurationHandler({ textField -> Void in
            textField.placeholder = "Defaults to kGMSMinZoomLevel (\(kGMSMinZoomLevel))"
            textField.keyboardType = UIKeyboardType.NumberPad
        })
        
        alert.addTextFieldWithConfigurationHandler({ textField -> Void in
            textField.placeholder = "Defaults to kGMSMaxZoomLevel (\(kGMSMaxZoomLevel))"
            textField.keyboardType = UIKeyboardType.NumberPad
        })
        
        alert.addAction(actionCancel)
        alert.addAction(actionOk)
        presentViewController(alert, animated: true, completion: nil)
    }
    func cameraForBoundsinsets() {
        
    } //Not Implemented
    func moveCamera() {
        let alert = UIAlertController(title: gmsMapViewCommands.moveCamera, message: "Changes the camera according to update. The camera change is instantaneous (with no animation). see Section: GMSCameraUpdate", preferredStyle: UIAlertControllerStyle.Alert)
        
        let actionOk = UIAlertAction(title: "OK", style: .Default) {
            action in
        }

        alert.addAction(actionOk)
        presentViewController(alert, animated: true, completion: nil)
    }
    func animateToCameraPosition() {
        let alert = UIAlertController(title: gmsMapViewCommands.animateToCameraPosition, message: "Animates the camera of this map to cameraPosition.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .Cancel) { action in
            println("\(action)")
        }
        
        let actionOk = UIAlertAction(title: "OK", style: .Default) {
            action in
            let latitude = alert.textFields![0] as! UITextField
            let longitude = alert.textFields![1] as! UITextField
            let zoom = alert.textFields![2] as! UITextField
            let bearing = alert.textFields![3] as! UITextField
            let viewingAngle = alert.textFields![4] as! UITextField
            
            let latitudeString : NSString = latitude.text
            let longitudeString : NSString = longitude.text
            let zoomString : NSString = zoom.text
            let bearingString : NSString = bearing.text
            let viewingAngleString : NSString = viewingAngle.text
            
            let location =  CLLocationCoordinate2DMake(latitudeString.doubleValue, longitudeString.doubleValue)
            let cameraPosition = GMSCameraPosition(target: location, zoom: zoomString.floatValue, bearing: bearingString.doubleValue, viewingAngle: viewingAngleString.doubleValue)
            self.mapView.animateToCameraPosition(cameraPosition)
        }
        
        alert.addTextFieldWithConfigurationHandler({ textField -> Void in
            textField.placeholder = "Latitude (Double)"
            textField.keyboardType = UIKeyboardType.NumberPad
        })
        
        alert.addTextFieldWithConfigurationHandler({ textField -> Void in
            textField.placeholder = "Longitude (Double)"
            textField.keyboardType = UIKeyboardType.NumberPad
        })
        alert.addTextFieldWithConfigurationHandler({ textField -> Void in
            textField.placeholder = "Zoom (Float)"
            textField.keyboardType = UIKeyboardType.NumberPad
        })
        
        alert.addTextFieldWithConfigurationHandler({ textField -> Void in
            textField.placeholder = "Bearing (0 degrees is North) (Double)"
            textField.keyboardType = UIKeyboardType.NumberPad
        })
        alert.addTextFieldWithConfigurationHandler({ textField -> Void in
            textField.placeholder = "Viewing Angle (Double)"
            textField.keyboardType = UIKeyboardType.NumberPad
        })
        
        alert.addAction(actionCancel)
        alert.addAction(actionOk)
        presentViewController(alert, animated: true, completion: nil)
    }
    func animateToLocation() {
        let alert = UIAlertController(title: gmsMapViewCommands.animateToLocation, message: "As animateToCameraPosition:, but changes only the location of the camera (i.e., from the current location to location).", preferredStyle: UIAlertControllerStyle.Alert)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .Cancel) { action in
            println("\(action)")
        }
        
        let actionOk = UIAlertAction(title: "OK", style: .Default) {
            action in
            let latitude = alert.textFields![0] as! UITextField
            let longitude = alert.textFields![1] as! UITextField
            
            let latitudeString : NSString = latitude.text
            let longitudeString : NSString = longitude.text
            
            let location =  CLLocationCoordinate2DMake(latitudeString.doubleValue, longitudeString.doubleValue)
            self.mapView.animateToLocation(location)
        }
        
        alert.addTextFieldWithConfigurationHandler({ textField -> Void in
            textField.placeholder = "Latitude (Double)"
            textField.keyboardType = UIKeyboardType.NumberPad
        })
        
        alert.addTextFieldWithConfigurationHandler({ textField -> Void in
            textField.placeholder = "Longitude (Double)"
            textField.keyboardType = UIKeyboardType.NumberPad
        })
        
        alert.addAction(actionCancel)
        alert.addAction(actionOk)
        presentViewController(alert, animated: true, completion: nil)
    }
    func animateToZoom() {
        let alert = UIAlertController(title: gmsMapViewCommands.animateToZoom, message: "As animateToCameraPosition:, but changes only the zoom level of the camera. This value is clamped by kGMSMinZoomLevel (\(kGMSMinZoomLevel)), kGMSMaxZoomLevel (\(kGMSMaxZoomLevel)).", preferredStyle: UIAlertControllerStyle.Alert)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .Cancel) { action in
            println("\(action)")
        }
        
        let actionOk = UIAlertAction(title: "OK", style: .Default) {
            action in
            let zoom = alert.textFields![0] as! UITextField
            let zoomString : NSString = zoom.text
            
            self.mapView.animateToZoom(zoomString.floatValue)
        }
        
        alert.addTextFieldWithConfigurationHandler({ textField -> Void in
            textField.placeholder = "(Float)"
            textField.keyboardType = UIKeyboardType.NumberPad
        })
        
        alert.addAction(actionCancel)
        alert.addAction(actionOk)
        presentViewController(alert, animated: true, completion: nil)
    }
    func animateToBearing() {
        let alert = UIAlertController(title: gmsMapViewCommands.animateToBearing, message: "As animateToCameraPosition:, but changes only the bearing of the camera (in degrees). Zero indicates true north.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .Cancel) { action in
            println("\(action)")
        }
        
        let actionOk = UIAlertAction(title: "OK", style: .Default) {
            action in
            let zoom = alert.textFields![0] as! UITextField
            let zoomString : NSString = zoom.text
            
            self.mapView.animateToBearing(zoomString.doubleValue)
        }
        
        alert.addTextFieldWithConfigurationHandler({ textField -> Void in
            textField.placeholder = "(Double)"
            textField.keyboardType = UIKeyboardType.NumberPad
        })
        
        alert.addAction(actionCancel)
        alert.addAction(actionOk)
        presentViewController(alert, animated: true, completion: nil)
    }
    func animateToViewingAngle() {
        let alert = UIAlertController(title: gmsMapViewCommands.animateToViewingAngle, message: "As animateToCameraPosition:, but changes only the viewing angle of the camera (in degrees). This value will be clamped to a minimum of zero (i.e., facing straight down) and between 30 and 45 degrees towards the horizon, depending on the relative closeness to the earth.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .Cancel) { action in
            println("\(action)")
        }
        
        let actionOk = UIAlertAction(title: "OK", style: .Default) {
            action in
            let zoom = alert.textFields![0] as! UITextField
            let zoomString : NSString = zoom.text
            
            self.mapView.animateToViewingAngle(zoomString.doubleValue)
        }
        
        alert.addTextFieldWithConfigurationHandler({ textField -> Void in
            textField.placeholder = "(Double)"
            textField.keyboardType = UIKeyboardType.NumberPad
        })
        
        alert.addAction(actionCancel)
        alert.addAction(actionOk)
        presentViewController(alert, animated: true, completion: nil)
    }
    func animateWithCameraUpdate() {
        let alert = UIAlertController(title: gmsMapViewCommands.animateWithCameraUpdate, message: "Applies cameraUpdate to the current camera, and then uses the result as per animateToCameraPosition: see Section: GMSCameraUpdate", preferredStyle: UIAlertControllerStyle.Alert)
        
        let actionOk = UIAlertAction(title: "OK", style: .Default) {
            action in
        }
        
        alert.addAction(actionOk)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func myLocationEnabled() {
        let alert = UIAlertController(title: gmsMapViewCommands.myLocationEnabled, message: "Controls whether the My Location dot and accuracy circle is enabled. Defaults to NO.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let no = UIAlertAction(title: "No", style: .Cancel) {
            action in
            self.mapView.myLocationEnabled = false
        }
        
        let yes = UIAlertAction(title: "Yes", style: .Default) {
            action in
            self.mapView.myLocationEnabled = true
        }
        
        alert.addAction(no)
        alert.addAction(yes)
        presentViewController(alert, animated: true, completion: nil)
    }

    func mapType() {
        let alert = UIAlertController(title: gmsMapViewCommands.mapType, message: "Controls the type of map tiles that should be displayed. Defaults to kGMSTypeNormal.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let none = UIAlertAction(title: "None", style: .Destructive) {
            action in
            self.mapView.mapType = kGMSTypeNone
        }

        let normal = UIAlertAction(title: "Normal", style: .Default) {
            action in
            self.mapView.mapType = kGMSTypeNormal
        }

        let hybrid = UIAlertAction(title: "Hybrid", style: .Default) {
            action in
            self.mapView.mapType = kGMSTypeHybrid
        }

        let satellite = UIAlertAction(title: "Satellite", style: .Default) {
            action in
            self.mapView.mapType = kGMSTypeSatellite
        }
        let terrain = UIAlertAction(title: "Terrain", style: .Default) {
            action in
            self.mapView.mapType = kGMSTypeTerrain
        }
        
        alert.addAction(none)
        alert.addAction(normal)
        alert.addAction(hybrid)
        alert.addAction(satellite)
        alert.addAction(terrain)
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func trafficEnabled() {
        let alert = UIAlertController(title: gmsMapViewCommands.trafficEnabled, message: "Controls whether the map is drawing traffic data, if available. This is subject to the availability of traffic data. Defaults to NO.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let no = UIAlertAction(title: "No", style: .Cancel) {
            action in
            self.mapView.trafficEnabled = false
        }
        
        let yes = UIAlertAction(title: "Yes", style: .Default) {
            action in
            self.mapView.trafficEnabled = true
        }
        
        alert.addAction(no)
        alert.addAction(yes)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func buildingsEnabled() {
        let alert = UIAlertController(title: gmsMapViewCommands.buildingsEnabled, message: "If set, 3D buildings will be shown where available. Defaults to YES.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let no = UIAlertAction(title: "No", style: .Cancel) {
            action in
            self.mapView.buildingsEnabled = false
        }
        
        let yes = UIAlertAction(title: "Yes", style: .Default) {
            action in
            self.mapView.buildingsEnabled = true
        }

        alert.addAction(no)
        alert.addAction(yes)
        presentViewController(alert, animated: true, completion: nil)
    }
}