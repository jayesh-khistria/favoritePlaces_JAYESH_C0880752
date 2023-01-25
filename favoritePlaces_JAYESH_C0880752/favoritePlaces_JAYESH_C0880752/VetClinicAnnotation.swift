//
//  VetClinicAnnotation.swift
//  favoritePlaces_JAYESH_C0880752
//
//  Created by Jayesh Khistria on 2023-01-24.
//

import UIKit
import MapKit

class VetClinicAnnotation: MKPointAnnotation {

    let name: String
    let address: String
    let image: UIImage
    
    init(with name: String, address: String, image: UIImage) {
        self.name = name
        self.address = address
        self.image = image
    }

    
}
