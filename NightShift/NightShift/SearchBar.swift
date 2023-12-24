//
//  SearchBar.swift
//  NightShift
//
//  Created by Alaa Eid on 23/12/2023.
//

import Foundation
import SwiftUI
import UIKit


struct SearchBar: UIViewRepresentable {
  
    
            
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
 
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
    
    
}
