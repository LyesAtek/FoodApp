//
//  CartManager.swift
//  FoodApp
//
//  Created by Lyes ATEK on 15/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit

class CartManager{
    
    static var shared = CartManager()
    
    var productsViewModel : [ProductViewModel] = []
    var numberOfUser : String = ""
    var paid : Bool = false
    
    
}
