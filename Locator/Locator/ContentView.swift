//
//  ContentView.swift
//  Locator
//
//  Created by Alaa Eid on 24/12/2023.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @ObservedObject var locationManager = LocationManager()
    @State var searchText: String = ""
    @State var landMarks = [LandMark]()
    private func getNearbyLandMarks() {
        guard let location = locationManager.location else {
            return
        }
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.region = MKCoordinateRegion(center: location.coordinate,
                                            latitudinalMeters: 1000,
                                            longitudinalMeters: 1000)
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let response = response, error == nil else {
                return
            }
            
            landMarks =
            response.mapItems.map {
                LandMark(placemark: $0.placemark)
                 }
            
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            
            MapView(landmarks: landMarks)
            TextField("Enter Location", text: $searchText) {
                getNearbyLandMarks()
            }.textFieldStyle(.roundedBorder)
                .padding()
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
