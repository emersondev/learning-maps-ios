//
//  ViewController.swift
//  learning-maps-ios
//
//  Created by Emerson.Novais on 13/04/22.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapReference: MKMapView!
    var managerLocal = CLLocationManager()
    var latitudeValue: CLLocationDegrees = 0.0
    var longitudeValue: CLLocationDegrees = 0.0
    let deltaLatitude: CLLocationDegrees = 0.001
    let deltaLongitude: CLLocationDegrees = 0.001
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        managerLocal.delegate = self
        managerLocal.desiredAccuracy = kCLLocationAccuracyBest
        managerLocal.requestWhenInUseAuthorization()
        managerLocal.startUpdatingLocation()

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationUser: CLLocation = locations.last!
        
        latitudeValue = locationUser.coordinate.latitude
        longitudeValue = locationUser.coordinate.longitude
        
        let areaVisualization: MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        
        let localRegion: MKCoordinateRegion = MKCoordinateRegion.init(center: location, span: areaVisualization)
        
        mapReference.setRegion(localRegion, animated: true)
    }


}

