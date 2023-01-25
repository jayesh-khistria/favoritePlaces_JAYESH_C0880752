//
//  mapViewViewController.swift
//  favoritePlaces_JAYESH_C0880752
//
//  Created by Jayesh Khistria on 2023-01-24.
//

import UIKit
import MapKit

class mapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var selectedLocationCount = 0
    var destination: CLLocationCoordinate2D!
    var cities = [City]()
    var touchPoints = [CGPoint]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.isZoomEnabled = false
        mapView.showsUserLocation = true
        mapView.delegate = self
        
        touchAnnotation()
       
    }
    
    @objc func placeAnnotation(sender: UITapGestureRecognizer) {
        
        
        let point = sender.location(in: mapView)
        let getCoordinate = mapView.convert(point, toCoordinateFrom: mapView)
        let annotation = MKPointAnnotation()

        touchPoints.append(point)
        selectedLocationCount += 1
        
        annotation.title = "Selected Location \(selectedLocationCount)"
        annotation.coordinate = getCoordinate
        mapView.addAnnotation(annotation)

        let locality = City(title: "Selected Location \(selectedLocationCount)", subtitle: "Selected Location \(selectedLocationCount)", coordinate: CLLocationCoordinate2DMake(getCoordinate.latitude, getCoordinate.longitude))
        cities.append(locality)

    }
    
    func touchAnnotation() {
        let touch = UITapGestureRecognizer(target: self, action: #selector(placeAnnotation))
        touch.numberOfTapsRequired = 1
        mapView.addGestureRecognizer(touch)
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let currentLocation = locations[0]
        let latitude = currentLocation.coordinate.latitude
        let longitude = currentLocation.coordinate.longitude
        print(currentLocation)
        displayLocation(latitude: latitude, longitude: longitude)
    }
    
    func displayLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let latDelta: CLLocationDegrees = 0.07
        let lngDelta: CLLocationDegrees =  0.07
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lngDelta)
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        if view.annotation is VetClinicAnnotation {
            // Use the annotation data
            
        }
        
    }

}

extension ViewController: MKMapViewDelegate {
    
}
