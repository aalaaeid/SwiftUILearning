//
//  OrderListView.swift
//  GetMeCoffee
//
//  Created by Alaa Eid on 20/12/2023.
//

import SwiftUI

struct OrderListView: View {

    
    var orders: [OrderViewModel]
    
    init(orders: [OrderViewModel]) {
        self.orders = orders
    }
    
    var body: some View {
        List {
            
            ForEach(self.orders, id: \.ID) { order in
                HStack {
                    Image(order.coffeeName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                      
                    VStack {
                        Text(order.orderName)
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        Text("\(order.total.formatted())")
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        
                        Text(order.orderSize)
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                            .foregroundColor(.brown)
                     
                    }.padding([.bottom, .leading], 10)
                }.padding()
                
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orders: [OrderViewModel(order: Order(name: "Coffee", size: "large", coffeeName: "Regular", total: 30.0))])
    }
}
