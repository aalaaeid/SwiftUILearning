//
//  ContentView.swift
//  MenuApp
//
//  Created by Alaa Eid on 22/12/2023.
//

import SwiftUI

struct ContentView: View {
    private var dishes = Dish.all()
    var body: some View {
    
        List{
            ForEach(dishes, id: \.self) { dish in
                DishCell(dish: dish)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
