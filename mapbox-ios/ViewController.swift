//
//  ViewController.swift
//  mapbox-ios
//
//  Created by Patrick Ngo on 2019-11-30.
//  Copyright © 2019 Patrick Ngo. All rights reserved.
//

import UIKit
import Mapbox

class ViewController: UIViewController, MGLMapViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        let mapView = MGLMapView(frame: view.bounds)
        
        
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        mapView.setCenter(CLLocationCoordinate2D(latitude: 1.2846952, longitude: 103.8443921), zoomLevel: 16, animated: false)
        view.addSubview(mapView)
        mapView.styleURL = MGLStyle.lightStyleURL
        
        // Add a point annotation
        let annotation = MGLPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 1.2867892, longitude: 103.8545014)
        annotation.title = "Merlion"
        annotation.subtitle = "A fish lion fountain thing"
        mapView.addAnnotation(annotation)
        
        // Set the map view's delegate
        mapView.delegate = self
        
        // Allow the map view to display the user's location
        mapView.showsUserLocation = true
    }
    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        // Always allow callouts to popup when annotations are tapped.
        return true
    }
    
    func mapView(_ mapView: MGLMapView, didSelect annotation: MGLAnnotation) {
        let camera = MGLMapCamera(lookingAtCenter: annotation.coordinate, fromDistance: 4500, pitch: 15, heading: 180)
        mapView.fly(to: camera, withDuration: 4,
                    peakAltitude: 3000, completionHandler: nil)
    }
}
