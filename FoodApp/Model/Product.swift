//
//  Product.swift
//  FoodApp
//
//  Created by Lyes ATEK on 11/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import Foundation

class Product{
    
    var _id : String
    var title : String
    var description : String
    var image : String
    var creation : String
    var price : Float
    var categoryIds : [String] = []
    public init(id : String, title : String, description : String, image : String, creation: String, price : Float, categoryIds : [String]){
        
        self._id = id
        self.title = title
        self.description = description
        self.image = image
        self.creation = creation
        self.price = price
        self.categoryIds = categoryIds
    }
    
}
