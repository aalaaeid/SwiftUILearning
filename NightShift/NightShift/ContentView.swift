//
//  ContentView.swift
//  NightShift
//
//  Created by Alaa Eid on 22/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isOn: Bool = false
    @State var isEnabled: Bool = false
    @State var sliderValue: CGFloat = 0.0
    
    var notifications = NotificationBody.all()

    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    
                    Toggle("Sechduled",
                           isOn: $isOn)
                    HStack {
                        VStack {
                            Text("From")
                            Text("To")
                        }.padding(5)
                        
                        Spacer()
                        
                        NavigationLink {
                            
                        } label: {
                            VStack {
                                Text("Morning")
                                Text("Night")
                            }.padding(5)
                                .foregroundColor(.blue)
                        }.fixedSize()
                        

                    }
                    
                    
                } header: {
                    Text("Night Shift Header Night Shift Header Night Shift Header Night Shift Header Night Shift Header Night Shift Header")
                        .padding(5)
                }
                
                Section {
                    Toggle("Manually Enable it until tommorrow",
                           isOn: $isEnabled)
                } header: {
                    Text("")
                }

                Section {
                    VStack {
                        Text("Temp value")
                        Slider(value: $sliderValue)
                    
                    }
                } header: {
                    Text("Color Temprature")
                }
                
                
                Section {
                    
                    List(notifications) { notification in
                        Text(notification.name)
                    }
                } header: {
                    Text("List")
                }
            }
            .navigationTitle("Night Shift")
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
