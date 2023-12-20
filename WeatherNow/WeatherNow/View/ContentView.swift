//
//  ContentView.swift
//  WeatherNow
//
//  Created by Alaa Eid on 19/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: WeatherVM
    
    init() {
        self.viewModel = WeatherVM()
    }
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter City Name", text: $viewModel.cityName) {
                viewModel.search()
            }.foregroundColor(.green)
                .multilineTextAlignment(.center)
                .padding()
                .fixedSize()
            Text("\(viewModel.temperature)")
                .foregroundColor(.green)
                .padding()
                .offset(y: 50)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
