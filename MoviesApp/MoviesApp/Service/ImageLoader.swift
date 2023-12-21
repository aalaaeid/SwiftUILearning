//
//  ImageLoader.swift
//  MoviesApp
//
//  Created by Alaa Eid on 21/12/2023.
//

import Foundation
import SwiftUI
import Combine


class ImageLoader: ObservableObject {
    
    var downloaderImage: UIImage?
    var didChange = PassthroughSubject<ImageLoader?, Never>()
    
    func load(url: String) {
        guard let imageURL = URL(string: url) else {
            fatalError("Can not find image")
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.didChange.send(nil)
                }
                return
            }
            self.downloaderImage = UIImage(data: data)
            DispatchQueue.main.async {
                self.didChange.send(self)
            }
            
        }.resume()
    }
    
}
