//
//  Order.swift
//  FoodApp
//
//  Created by Lyes ATEK on 11/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import Foundation

class Order{
    
    var user : String
    var products : [OrderProduct]
    var paid : Bool
    
    init(user : String, products : [OrderProduct], paid : Bool){
        
        self.user = user
        self.products = products
        self.paid = paid
    }
    
    
}
