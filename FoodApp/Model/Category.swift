//
//  Category.swift
//  FoodApp
//
//  Created by Lyes ATEK on 11/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import Foundation

class Category{
    
    var  _id : String
    var title : String
    var  creation : String
    var image : String
    
    public init(id : String,tittle: String, creation: String, image: String){
        self._id = id
        self.title = tittle
        self.creation = creation
        self.image = image
    }
    
}
