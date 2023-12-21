//
//  MovieDetailsView.swift
//  MoviesApp
//
//  Created by Alaa Eid on 21/12/2023.

//

import Foundation
import SwiftUI

struct MovieDetailsView: View {
    let movie: Movie
    @State var isSelected: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)
        
            VStack {
                HStack {
                    Spacer()
                    StarViewRepresentation(selected: $isSelected)
                        .frame(width: 35, height: 35)
                        .padding()
                }
                URLImage(url: movie.poster)
                    .cornerRadius(12)
                    
                Text(movie.title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }.padding()
            
        }
    }
    
    
}

#if DEBUG
struct MovieDetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        let movie = Movie(title: "BatMan", imdbId: "20", poster: "https://fyrafix.files.wordpress.com/2011/08/url-8.jpg")
        MovieDetailsView(movie: movie)
    }
    
    
}
 
#endif
