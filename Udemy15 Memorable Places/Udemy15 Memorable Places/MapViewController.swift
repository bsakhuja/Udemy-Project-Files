//
//  MapViewController.swift
//  Udemy15 Memorable Places
//
//  Created by Brian Sakhuja on 9/19/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(MapViewController.longpress(gestureRecognizer:)))
        uilpgr.minimumPressDuration = 2
        mapView.addGestureRecognizer(uilpgr)
        
        
        if activePlace == -1
        {
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        }
        else
        {
            // get details to display on map
            if places.count > activePlace
            {
                if let placeName = places[activePlace]["name"]
                {
                    if let lat = places[activePlace]["lat"]
                    {
                        if let lon = places[activePlace]["lon"]
                        {
                            if let latitude = Double(lat)
                            {
                                if let longitude = Double(lon)
                                {
                                    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                    let region = MKCoordinateRegion(center: coordinate, span: span)
                                    self.mapView.setRegion(region, animated: true)
                                    
                                    let annotation = MKPointAnnotation()
                                    annotation.coordinate = coordinate
                                    annotation.title = placeName
                                    self.mapView.addAnnotation(annotation)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    @objc func longpress(gestureRecognizer: UIGestureRecognizer)
    {
        var title = ""
        if gestureRecognizer.state == UIGestureRecognizer.State.began
        {
            let touchPoint = gestureRecognizer.location(in: self.mapView)
            let newCoordinate = self.mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
            let location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
            
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                
                if error != nil
                {
                    print(error)
                }
                else
                {
                    if let placemark = placemarks?[0]
                    {
                        if placemark.subThoroughfare != nil
                        {
                            title += placemark.subThoroughfare! + " "
                        }
                        if placemark.thoroughfare != nil
                        {
                            title += placemark.thoroughfare!
                        }
                    }
                    if title != ""
                    {
                        title = "Added: \(NSDate())"
                    }
                    
                    let annotation = MKPointAnnotation()
                    
                    annotation.coordinate = newCoordinate
                    annotation.title = title
                    self.mapView.addAnnotation(annotation)
                    places.append(["name": title, "lat": String(newCoordinate.latitude), "lon": String(newCoordinate.longitude)])
                }
            })
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        self.mapView.setRegion(region, animated: true)
    }
    
    
}
