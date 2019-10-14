//
//  WBProduct.swift
//  FoodApp
//
//  Created by Lyes ATEK on 13/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import Foundation

class WBProduct {
    
    static let shared  = WBProduct()
    
    
    
    func GetProduct(categoryId : String,_ completion: @escaping (_ result: [Product]) -> Void){
        
        var products : [Product] = []
        let urlPath :String = FoodServer.GetBaseURL() + "products/category/" + categoryId
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
                products = self.JSONToProductArray(jsonResult)
                completion(products)
            }catch{
                print("error to parse json")
            }
        })
        task.resume()
        
    }
    
    func JSONToProductArray(_ jsonEvents : NSArray) -> [Product]{
        var products : [Product] = []
        for object in jsonEvents{
            let id = (object as AnyObject).object(forKey: "_id") as! String
            let title = (object as AnyObject).object(forKey: "title") as! String
            let description = (object as AnyObject).object(forKey: "description") as! String
            let price = (object as AnyObject).object(forKey: "price") as! NSNumber
            let creation = (object as AnyObject).object(forKey: "creation") as! String
            let image = (object as AnyObject).object(forKey: "image") as! String
            let categoryIds =  (object as AnyObject).object(forKey: "categoryIds") as! [String]
            
            let newProduct : Product = Product(id: id, title: title, description: description, image: image, creation: creation, price: price.floatValue, categoryIds: categoryIds)
            products.append(newProduct)

        }
        return products
    }
    
    
    
}
