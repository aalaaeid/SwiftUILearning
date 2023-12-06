//
//  ContentView.swift
//  swiftUILearning
//
//  Created by Alaa Eid on 28/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    let wallpapers = [TestImageModel(name: "likes", image: "likes-illustration"),
                      TestImageModel(name: "Thanks", image: "thanks"),
                      TestImageModel(name: "search", image: "Search-Not-Found"),
                      TestImageModel(name: "Connection", image: "no-connection")]
    
    
    var body: some View {
        NavigationStack {
            List(wallpapers) { wallpaper in
                NavigationLink(value: wallpaper) {
                    ExtractedView(wallpaper: wallpaper)
                }
            }
        }.navigationTitle("Wallpapers")
            .navigationDestination(for: TestImageModel.self) { wallpaper in
                Text(wallpaper.name)
            }
      
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TestImageModel: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var image: String
}

struct ExtractedView: View {
    
    var wallpaper: TestImageModel
    
    var body: some View {
      
        HStack {
            Image(wallpaper.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .frame(width: 75, height: 75)
                .padding(20)
            Text(wallpaper.name)
        }
    }
}
