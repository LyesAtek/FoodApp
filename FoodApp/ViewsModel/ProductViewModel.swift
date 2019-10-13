//
//  ProductViewModel.swift
//  FoodApp
//
//  Created by Lyes ATEK on 13/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import Foundation

class ProductViewModel{
    
    var productId : String
    var productTitle : String
    var productDescription : String
    var productPrice : Float
    var productImage : String
    
    init(product : Product){
        self.productId = product._id
        self.productImage = product.image
        self.productPrice = product.price
        self.productTitle = product.title
        self.productDescription = product.description
    }
    
}
