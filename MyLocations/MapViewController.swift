//
//  MapViewController.swift
//  MyLocations
//
//  Created by snake on 15/7/23.
//  Copyright (c) 2015年 snakeLib. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    var managedObjectContext: NSManagedObjectContext!
    var locations = [Location]()
    
    @IBAction func showUser() {
        let region = MKCoordinateRegionMakeWithDistance(mapView.userLocation.coordinate, 1000, 1000)
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
    }
    
    @IBAction func showLocations() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLocations()
    }
    
    func updateLocations() {
        let entity = NSEntityDescription.entityForName("Location", inManagedObjectContext: managedObjectContext)
        
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = entity
        
        var error: NSError?
        let foundObjects = managedObjectContext.executeFetchRequest(fetchRequest, error: &error)
        if foundObjects == nil {
            fatalCoreDataError(error)
            return
        }
        
        mapView.removeAnnotations(locations)
        
        locations = foundObjects as! [Location]
        mapView.addAnnotations(locations)
    }
}

extension MapViewController: MKMapViewDelegate {
    
}
