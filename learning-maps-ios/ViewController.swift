//
//  ViewController.swift
//  learning-maps-ios
//
//  Created by Emerson.Novais on 13/04/22.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapReference: MKMapView!
    
    let latitudeValue: CLLocationDegrees = -22.69896843334008
    let longitudeValue: CLLocationDegrees = -46.987800181880765
    let deltaLatitude: CLLocationDegrees = 0.001
    let deltaLongitude: CLLocationDegrees = 0.001
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let areaVisualization: MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        
        let localRegion: MKCoordinateRegion = MKCoordinateRegion.init(center: location, span: areaVisualization)
        
        mapReference.setRegion(localRegion, animated: true)
    }


}

