//
//  LandMarkAnnotations.swift
//  Locator
//
//  Created by Alaa Eid on 24/12/2023.
//

import Foundation
import MapKit

final class LandMarkAnnotations: NSObject, MKAnnotation {
    
    let coordinate: CLLocationCoordinate2D
    let title: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?) {
        self.coordinate = coordinate
        self.title = title
    }
    
}
