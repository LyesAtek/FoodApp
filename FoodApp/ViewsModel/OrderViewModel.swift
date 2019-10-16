//
//  OrderViewModel.swift
//  FoodApp
//
//  Created by Lyes ATEK on 15/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit

class OrderViewModel{
    
    var userPhone : String
    
    var products : [[ProductViewModel]]
    var paid : Bool
    
    var orderProducts : [OrderProduct] = []
    
    
    init(userPhone : String, products : [[ProductViewModel]], paid: Bool){
        self.userPhone = userPhone
        self.products = products
        self.paid = paid
        self.buildOrderProducts()
    }
    
   
    func buildOrderProducts(){
        for product in self.products{
            let orderProduct =  OrderProduct(productId: product[0].productId, quantity: product.count)
            self.orderProducts.append(orderProduct)
        }
    }
    
    
}
