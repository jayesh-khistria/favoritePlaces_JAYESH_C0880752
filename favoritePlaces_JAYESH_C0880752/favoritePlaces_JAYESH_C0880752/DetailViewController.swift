//
//  DetailViewController.swift
//  favoritePlaces_JAYESH_C0880752
//
//  Created by Jayesh Khistria on 2023-01-24.
//

import UIKit
import MapKit


struct PlacesOnMap {
    var name: String
    var latitude: Double
    var longitude: Double

init(name: String, latitude: Double, longitude: Double) {
    self.name = name
    self.latitude = latitude
    self.longitude = longitude
    }
}

