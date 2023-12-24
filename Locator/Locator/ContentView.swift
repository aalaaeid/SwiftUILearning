//
//  ContentView.swift
//  Locator
//
//  Created by Alaa Eid on 24/12/2023.
//

import SwiftUI
import MapKit

struct ContentView: View {
    

    
    @StateObject private var placeListVM = PlaceListViewModel()
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var searchTerm: String = ""
    
    private func getRegion() -> Binding<MKCoordinateRegion> {
        
        guard let coordinate = placeListVM.currentLocation else {
            return .constant(MKCoordinateRegion.defaultRegion)
        }
        
        return .constant(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
        
    }
    
 
    
    var body: some View {
        ZStack(alignment: .top) {
            Map(coordinateRegion: getRegion(), interactionModes: .all, showsUserLocation: true, userTrackingMode: $userTrackingMode, annotationItems: placeListVM.landmarks) { landmark in
                MapMarker(coordinate: landmark.coordinate)
            }
            TextField("Enter Location", text: $searchTerm) {
                placeListVM.searchLandmarks(searchTerm: searchTerm)

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
