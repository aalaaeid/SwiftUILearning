//
//  BulbContentView.swift
//  swiftUILearning
//
//  Created by Alaa Eid on 18/12/2023.
//

import SwiftUI


class AppState: ObservableObject {
     @Published var isOn: Bool = false
}

struct MainRoom: View {
    
    @EnvironmentObject private var appState: AppState
    var body: some View {
        VStack {
            Image(systemName: "lightbulb")
                .font(.largeTitle)
                .foregroundColor( appState.isOn ? .yellow : .black)
        
            Toggle("Switch", isOn: $appState.isOn)
                .fixedSize()
        }
    }
}

struct ChildRoom: View {
    
    
    var body: some View {
        MainRoom()
    }
}

struct BulbContentView: View {
    
    
    var body: some View {
       
        ChildRoom()
    }
}

struct BulbContentView_Previews: PreviewProvider {
    static var previews: some View {
      
            BulbContentView()
            .environmentObject(AppState())
    }
}
