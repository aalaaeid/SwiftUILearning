//
//  ContentView.swift
//  GetMeCoffee
//
//  Created by Alaa Eid on 20/12/2023.
//

import SwiftUI

struct ContentView: View {

   @ObservedObject var viewModel = OrderListViewModel()

    var body: some View {
        
        NavigationView {
            OrderListView(orders: viewModel.orders)
                .navigationTitle("Coffee Orders")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
