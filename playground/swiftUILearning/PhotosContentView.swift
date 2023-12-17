//
//  PhotosContentView.swift
//  swiftUILearning
//
//  Created by Alaa Eid on 06/12/2023.
//

import SwiftUI

struct PhotosContentView: View {
    
    let wallpapers = [TestImageModel(name: "flower A", image: "flowers-3"),
                      TestImageModel(name: "flower B", image: "flowers-4"),
                      TestImageModel(name: "flower C", image: "flowers-5"),
                      TestImageModel(name: "flower D", image: "flowers-6")]
    
    
    var body: some View {
        NavigationStack {
            List(wallpapers) { wallpaper in
                NavigationLink(value: wallpaper) {
                    ExtractedView(wallpaper: wallpaper)
                }
                
            }.navigationTitle("Wall papers")
                .navigationDestination(for: TestImageModel.self) { wallpaper in
                    PhotoDetailsScreen(wallpaper: wallpaper)
                }
        }
        
    }
}

struct PhotosContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosContentView()
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
