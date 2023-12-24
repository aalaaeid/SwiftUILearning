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
   
    let landmarks: [LandMark]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.delegate = context.coordinator
        return mapView
    }
    
    

    
    func updateUIView(_ uiView: MKMapView, context: Context) {

        updateAnotation(from: uiView)
    }
    
    func updateAnotation(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotation = landmarks.map {
            LandMarkAnnotations(coordinate: $0.coordinate, title: $0.title)
        }
        mapView.addAnnotations(annotation)
    }
    func makeCoordinator() -> Coordinator {
      Coordinator(self)
    }
}
