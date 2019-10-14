//
//  CategoryViewModel.swift
//  FoodApp
//
//  Created by Lyes ATEK on 11/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import Foundation


class CategoryViewModel{
    var categoryTitle : String 
    var categoryId : String
    var categoryImage : String
    
    init(category : Category){
        categoryId = category._id
        categoryTitle = category.title
        categoryImage = category.image
    }
    
    init(id: String, title: String, image: String){
        self.categoryId = id
        self.categoryImage = image
        self.categoryTitle = title
    }
    
   
}
