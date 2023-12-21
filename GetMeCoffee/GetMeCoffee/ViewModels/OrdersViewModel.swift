//
//  OrdersViewModel.swift
//  GetMeCoffee
//
//  Created by Alaa Eid on 20/12/2023.
//

import Foundation
import SwiftUI


class OrderListViewModel: ObservableObject {
    
    
    init() {
        getOrders()
    }
    
   @Published var orders: [OrderViewModel] = []
    
    func getOrders() {
        Webservice().getAllOrders { orders in
            if let orders = orders {
                self.orders = orders.map(OrderViewModel.init)
            }
           
        }
    }
    

}


class OrderViewModel: Identifiable  {
    
    let ID = UUID()
    
    var order: Order
    var createdOrder: CreateOrderResponse?
    
    init(order: Order) {
        self.order = order
    }
    
    var orderName: String {
        order.name
    }
    
    var coffeeName: String {
        order.coffeeName
    }
    
    var orderSize: String {
        order.size
    }
    
    var total: Double {
        order.total
    }
    
    func createCoffee() {
        Webservice().createCoffeeOrder(order: order) { createOrderResponse in
            
            self.createdOrder = createOrderResponse
        }
    }
}
