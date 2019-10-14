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
    var categoryId : String?
    init(product : Product){
        self.productId = product._id
        self.productImage = product.image
        self.productPrice = product.price
        self.productTitle = product.title
        self.productDescription = product.description
        if(product.categoryIds.count>0){
            self.categoryId = product.categoryIds[0]
        }
    }
    
    init(productId : String, productTitle : String, productDescription : String, productPrice : Float, productImage: String, categoryId : String?){
        self.productPrice = productPrice
        self.productImage = productImage
        self.productDescription = productDescription
        self.productTitle = productTitle
        self.productId = productId
        self.categoryId = categoryId
        
    }
    
}
