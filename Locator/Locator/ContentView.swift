//
//  ContentView.swift
//  Locator
//
//  Created by Alaa Eid on 24/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
    
        MapView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
