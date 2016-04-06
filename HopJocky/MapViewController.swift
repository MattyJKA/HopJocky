//
//  MapViewController.swift
//  HopJocky
//
//  Created by Vinh Nguyen on 3/22/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var viewMap: GMSMapView!
    
    @IBOutlet weak var searchBarTextField: UITextField!
    
    var locationManager = CLLocationManager()
    
    var mapTasks = MapTasks()
    
    var locationMarker: GMSMarker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(48.857165, longitude: 2.354613, zoom: 12.0)
        viewMap.camera = camera
        
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchAddress(sender: AnyObject) {
        
        let address = searchBarTextField.text!
        
        self.mapTasks.geocodeAddress(address, withCompletionHandler: { (status, success) -> Void in
            
            if !success {
                print(status)
                
                if status == "ZERO_RESULTS" {
                    self.showAlertWithMessage("The location could not be found.")
                }
            }
            else {
                let coordinate = CLLocationCoordinate2D(latitude: self.mapTasks.fetchedAddressLatitude, longitude: self.mapTasks.fetchedAddressLongitude)
                
                self.viewMap.camera = GMSCameraPosition.cameraWithTarget(coordinate, zoom: 15.0)
                
                self.setupLocationMarker(coordinate)
                
            }
            
        })
        
    }

    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        if status == .AuthorizedWhenInUse {
            
            locationManager.startUpdatingLocation()
            
            viewMap.myLocationEnabled = true
            
            viewMap.settings.myLocationButton = true
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            viewMap.camera = GMSCameraPosition(target: location.coordinate, zoom: 12, bearing: 0, viewingAngle: 0)
            
            locationManager.stopUpdatingLocation()
        }
        
    }
    
    func showAlertWithMessage(message: String) {
        let alertController = UIAlertController(title: "HopJocky", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        let closeAction = UIAlertAction(title: "Close", style: UIAlertActionStyle.Cancel) { (alertAction) -> Void in
            
        }
        
        alertController.addAction(closeAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    func setupLocationMarker(coordinate: CLLocationCoordinate2D) {
        
        if locationMarker != nil {
            locationMarker.map = nil
        }
        
        locationMarker = GMSMarker(position: coordinate)
        
        locationMarker.map = viewMap
        
        locationMarker.title = mapTasks.fetchedFormattedAddress
        //        locationMarker.icon = GMSMarker.markerImageWithColor(UIColor.blueColor())
        locationMarker.appearAnimation = kGMSMarkerAnimationPop
        locationMarker.opacity = 0.6
//        locationMarker.flat = true
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
