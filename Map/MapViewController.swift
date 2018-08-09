//
//  MapViewController.swift
//  Map
//
//  Created by Benjamin Pisano on 26/01/2018.
//  Copyright © 2018 Snopia. All rights reserved.
//

import UIKit
import MapKit

extension MKMapView {
    func set(_ type: MKMapType) {
        self.mapType = type
    }
    
    func addPin(place: Place) {
        let point = MKPointAnnotation()
        point.coordinate = place.coordinate
        point.title = place.title
        point.subtitle = place.description
        
        self.addAnnotation(point)
    }
    
    func zoomOn(place: Place) {
        var region = MKCoordinateRegionMakeWithDistance(place.coordinate, 500, 500)
        region.center.latitude = place.coordinate.latitude
        region.center.longitude = place.coordinate.longitude
        
        self.setRegion(region, animated: true)
    }
}

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapSegmented: UISegmentedControl!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var detailView: UIVisualEffectView!
    
    let locationManager = CLLocationManager()
    var userCoordinate: CLLocationCoordinate2D?
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        if place == nil {
            detailView.removeFromSuperview()
        }
        
        if let p = place {
            place = p
        }
        else {
            place = Place(coordinate: CLLocationCoordinate2DMake(45.739368, 4.817544), title: "Le 101", description: "A cool place to be", text: "The best coding school ever.")
        }
        
        aboutLabel.text = "About " + place!.title
        descriptionLabel.text = place!.text
        setupMap()
    }
    
    
    //////////////////////////////
    // MARK: - Location Manager //
    //////////////////////////////
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        
        mapView.showsUserLocation = true
    }
    
    
    /////////////////////////
    // MARK: - Map Manager //
    /////////////////////////

    private func setupMap() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
        
        mapSegmented.selectedSegmentIndex = 2
        mapView.delegate = self
        mapView.set(.hybrid)
        mapView.addPin(place: place!)
        mapView.zoomOn(place: place!)
    }
    
    @IBAction func displayLocation(_ sender: Any) {
        let locationPlace = Place(coordinate: mapView.userLocation.coordinate, title: "", description: "", text: "")
        
        mapView.zoomOn(place: locationPlace)
    }
    
    @IBAction func switchChanged(_ sender: Any) {
        switch mapSegmented.selectedSegmentIndex {
        case 0:
            mapView.set(.standard)
        case 1:
            mapView.set(.satellite)
        case 2:
            mapView.set(.hybrid)
        default:
            mapView.set(.standard)
        }
    }
    
    
    ////////////////////////
    // MARK: - Navigation //
    ////////////////////////
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let detailVC = segue.destination as! DetailViewController
            detailVC.detailtext = place!.text
        }
    }
}
