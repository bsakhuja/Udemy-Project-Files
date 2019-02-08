//
//  ViewController.swift
//  Udemy11 Maps
//
//  Created by Brian Sakhuja on 9/12/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let latitude: CLLocationDegrees = 27.175
        let longitude: CLLocationDegrees = 88.039
        
        let latDelta: CLLocationDegrees = 0.05 // zoom
        let longDelta: CLLocationDegrees = 0.05 // zoom
        
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinates, span: span)
        
        map.setRegion(region, animated: true)
        
        // add annotation
//        let annotation = MKPointAnnotation()
//        annotation.title = "Taj Mahal"
//        annotation.subtitle = "One day I'll go here"
//        annotation.coordinate = coordinates
//        map.addAnnotation(annotation)
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer: )))
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
        
        
        
    }

    @objc func longpress(gestureRecognizer: UIGestureRecognizer)
    {
        let touchPoint = gestureRecognizer.location(in: self.map)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "new place"
        annotation.subtitle = "wow"
        map.addAnnotation(annotation)
    }

}

