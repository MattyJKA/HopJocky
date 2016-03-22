//
//  MapViewController.swift
//  HopJocky
//
//  Created by Vinh Nguyen on 3/22/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.cameraWithLatitude(30.295561, longitude: -97.743356, zoom: 12)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        mapView.settings.compassButton = true
    
        self.view = mapView
        
        let marker = GMSMarker()
        let marker1 = GMSMarker()
        
        marker.position = CLLocationCoordinate2DMake(30.295561, -97.743356)
        marker.title = "Growler USA"
        marker.snippet = "609 W. 29th St, Austin, TX 78705"
        marker.map = mapView
        
        marker1.position = CLLocationCoordinate2DMake(30.266132, -97.745825)
        marker1.title = "The Ginger Man"
        marker1.snippet = "301 Lavaca St, Austin, TX 78701"
        marker1.map = mapView
        
        
        
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
