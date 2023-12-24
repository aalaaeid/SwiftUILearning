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
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true)
                }
            }
        }
        
    }

    
}
