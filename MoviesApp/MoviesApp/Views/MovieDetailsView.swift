//
//  MovieDetailsView.swift
//  MoviesApp
//
//  Created by Alaa Eid on 21/12/2023.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI

struct MovieDetailsView: View {
    let movie: Movie
    
    var body: some View {
        
        VStack {
            URLImage(url: movie.poster)
            Text(movie.title)
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
