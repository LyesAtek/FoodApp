//
//  CategoryViewModel.swift
//  FoodApp
//
//  Created by Lyes ATEK on 11/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import Foundation


class CategoryViewModel{
    var title : String
    var creation : String
    var id : String
    var image : String
    
    init(category : AnyObject){
         id = category.object(forKey: "_id") as! String
         title = category.object(forKey: "title") as! String
         creation = category.object(forKey: "creation") as! String
         image = category.object(forKey: "image") as! String
    }

}
