//
//  PhotoDetails.swift
//  swiftUILearning
//
//  Created by Alaa Eid on 06/12/2023.
//

import SwiftUI

struct PhotoDetailsScreen: View {
    let wallpaper: TestImageModel
    
    var body: some View {
        VStack(spacing: 20) {
            Image(wallpaper.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(wallpaper.name)
            
        } .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct PhotoDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PhotoDetailsScreen(wallpaper: TestImageModel(name: "", image: ""))
        }
    }
}
