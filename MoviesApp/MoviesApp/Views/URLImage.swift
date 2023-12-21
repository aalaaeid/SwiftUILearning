//
//  URLImage.swift
//  MoviesApp
//
//  Created by Alaa Eid on 21/12/2023.
//

import SwiftUI

struct URLImage: View {
    let url: String
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String) {
        self.url = url
        self.imageLoader.load(url: self.url)

    }
    
    var body: some View {
        if let image = imageLoader.downloaderImage {
            return Image(uiImage: image)
                .resizable()
        } else {
            return Image("placeholder")
                .resizable()
        }

    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://fyrafix.files.wordpress.com/2011/08/url-8.jpg")
    }
}
