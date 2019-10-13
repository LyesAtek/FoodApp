//
//  WBCategory.swift
//  FoodApp
//
//  Created by Lyes ATEK on 11/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import Foundation

public class WBCategory : NSObject{
   static let shared  = WBCategory()
  
   func GetCategories(_ completion: @escaping (_ result: [Category]) -> Void){
        
        var categories : [Category] = []
        let urlPath :String = FoodServer.GetBaseURL() + "categories"
        let url: URL = URL(string: urlPath)!
        let session = URLSession.shared
    
        let task = session.dataTask(with: url, completionHandler: {
            data, response, error -> Void in
            if error != nil {
                // If there is an error in the web request, print it to the console
                print(error!.localizedDescription)
            }
            do{
               let jsonResult = try JSONSerialization.jsonObject(with: data!,  options: .allowFragments) as! NSArray
            categories = self.JSONToCategoryArray(jsonResult)
            completion(categories)
            }catch{
                print("error to parse json")
            }
        })
        task.resume()
   
    }
    
    


   
    func JSONToCategoryArray(_ jsonEvents : NSArray) -> [Category]{
        var categories : [Category] = []
        for object in jsonEvents{
            let id = (object as AnyObject).object(forKey: "_id") as! String
            let title = (object as AnyObject).object(forKey: "title") as! String
            let creation = (object as AnyObject).object(forKey: "creation") as! String
            let image = (object as AnyObject).object(forKey: "image") as! String
            let newCategory : Category = Category(id: id, tittle: title, creation: creation, image: image)
            categories.append( newCategory)
        }
        return categories
    }
   
}
