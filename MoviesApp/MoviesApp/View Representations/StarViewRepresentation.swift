//
//  StarViewRepresentation.swift
//  MoviesApp
//
//  Created by Alaa Eid on 21/12/2023.
//

import Foundation
import SwiftUI

struct StarViewRepresentation: UIViewRepresentable {

    @Binding var selected: Bool
    
    typealias UIViewType = StarView
    
    func makeUIView(context: Context) -> StarView {
        let view = StarView()
        return view
    }
    
    func updateUIView(_ uiView: StarView, context: Context) {
        uiView.selected = selected
    }
    
    
}
