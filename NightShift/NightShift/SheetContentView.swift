//
//  SheetContentView.swift
//  NightShift
//
//  Created by Alaa Eid on 22/12/2023.
//

import SwiftUI

struct SheetContentView: View {
    
    @State var isSheetPresented: Bool = false
    var flags = Flag.all()
    @State var selectedFlags: String = ""
    @State var selection: String = ""
    
    var body: some View {
        
        List {
            ForEach(flags) { flag in
                
                Text(flag.name).onTapGesture {
                    isSheetPresented = true
                    selection = flag.name
                }
            }
        }.sheet(isPresented: $isSheetPresented) {
            Text(selection)
        }
    

    }
}

struct SheetContentView_Previews: PreviewProvider {
    static var previews: some View {
        SheetContentView()
    }
}
