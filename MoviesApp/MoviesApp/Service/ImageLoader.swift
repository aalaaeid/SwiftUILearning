//
//  ImageLoader.swift
//  MoviesApp
//
//  Created by Alaa Eid on 21/12/2023.
//

import Foundation
import SwiftUI


class ImageLoader: ObservableObject {
    
    @Published var downloaderImage: UIImage?
    
    func load(url: String) {
        guard let imageURL = URL(string: url) else {
            fatalError("Can not find image")
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.downloaderImage = nil
                }
                return
            }
           
            DispatchQueue.main.async {
                self.downloaderImage = UIImage(data: data)
            }
            
        }.resume()
    }
    
}
