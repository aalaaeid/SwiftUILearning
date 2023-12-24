//
//  Coordinator.swift
//  Locator
//
//  Created by Alaa Eid on 24/12/2023.
//

import Foundation
import MapKit

class Coordinator: NSObject, MKMapViewDelegate {
    
    let control: MapView
    
    init(_ control: MapView) {
        self.control = control
    }
    
    
}
