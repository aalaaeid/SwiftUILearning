//
//  BulbContentView.swift
//  swiftUILearning
//
//  Created by Alaa Eid on 18/12/2023.
//

import SwiftUI

struct BulbContentView: View {
    
    @State private var name: String = ""
    @State private var names = ["Alaa", "lelo", "Esraa"]
    @State private var filterdNames: [String] = []
    
    var body: some View {
        VStack {
       
            List(filterdNames, id: \.self) { friend in
                Text(friend)
                    .font(.largeTitle)
            }.listStyle(.plain)
                .searchable(text: $name)
                .onChange(of: name) { newValue in
                    if name.isEmpty {
                        filterdNames = names
                    } else {
                        filterdNames = names.filter({ $0.lowercased() == name.lowercased()})
                    }
                   
                }
                
         Spacer()
        }.padding()
            .onAppear {
                filterdNames = names
            }
            .navigationTitle("Friends")
    }
}

struct BulbContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BulbContentView()}
    }
}
