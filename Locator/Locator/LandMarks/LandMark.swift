//
//  LandMark.swift
//  Locator
//
//  Created by Alaa Eid on 24/12/2023.
//

import Foundation
import MapKit

struct LandMark {
    let id = UUID()
    let placemark: MKPlacemark
    
    var name: String {
        placemark.name ?? ""
    }
    
    var title: String {
        placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        placemark.coordinate 
    }
}
