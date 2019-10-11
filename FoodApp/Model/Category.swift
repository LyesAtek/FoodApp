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
    var tittle : String
    var  creation : String
    
    init(id : String,tittle: String, creation: String){
        self._id = id
        self.tittle = tittle
        self.creation = creation
    }
    
}
