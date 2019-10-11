//
//  CategoryViewModel.swift
//  FoodApp
//
//  Created by Lyes ATEK on 11/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import Foundation


class CategoryViewModel{
    
    var categories : [Category] = []
    
    
    func GetCategories(data : Data) -> Void{
         do{
               let jsonResult = try JSONSerialization.jsonObject(with: data,  options: .allowFragments) as! NSArray
                 self.categories = self.JSONToCategoryArray(jsonResult)
        }catch{
                print("error parse")
         } 
    }
    func JSONToCategoryArray(_ jsonEvents : NSArray) -> [Category]{
        var categories : [Category] = []
        for object in jsonEvents{
            let id = (object as AnyObject).object(forKey: "_id") as! String
            let title = (object as AnyObject).object(forKey: "title") as! String
            let creation = (object as AnyObject).object(forKey: "creation") as! String
            let newCategory : Category = Category(id: id, tittle: title, creation: creation)
            categories.append( newCategory)
        }
        return categories
    }
    
    
}
