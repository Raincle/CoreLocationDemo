//
//  ViewController.swift
//  CoreLocationDemo
//
//  Created by 洪亞偉 on 5/15/15.
//  Copyright (c) 2015 洪亞偉. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var MKView: MKMapView!
    
    var coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    var placemark: CLPlacemark?
    var locationManager: CLLocationManager!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10


        locationManager.requestWhenInUseAuthorization()
        
        
        let authorizationStatus = CLLocationManager.authorizationStatus()
        
        if(authorizationStatus == .AuthorizedWhenInUse || authorizationStatus == .AuthorizedAlways) {
            
            locationManager.startUpdatingLocation()
        }
        
        
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //CoreLocation Delegate
    

    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
        
        println(newLocation.description)
        
        var region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 1000, 1000)
        
        MKView.setRegion(region, animated: true)
    }
    
    

}

