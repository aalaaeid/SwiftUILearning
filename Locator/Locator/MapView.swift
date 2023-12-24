//
//  MapView.swift
//  Locator
//
//  Created by Alaa Eid on 24/12/2023.
//

import Foundation
import MapKit
import UIKit
import SwiftUI


struct MapView: UIViewRepresentable {
   
    
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.delegate = context.coordinator
        return mapView
    }
    
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        let coordinator = Coordinator()
        return coordinator
    }
}
