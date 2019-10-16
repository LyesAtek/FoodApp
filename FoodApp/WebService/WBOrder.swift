//
//  WBOrder.swift
//  FoodApp
//
//  Created by Lyes ATEK on 15/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import Foundation

class WBOrder{
    
    static let shared : WBOrder = WBOrder()
    
    //TODO Encodable JSON
  /*  func CreateOrder(orderViewModel : OrderViewModel,_ completion: @escaping () -> Void){
       // var order : Order
        var jsonTab : [[String: Any]] = []
        
      //  jsonTest[jsonTest.length]
        for product in orderViewModel.orderProducts{
            jsonTab.append(["productId":product.productId,"quantity":product.quantity])
        }
      
        let json: [String: Any] = ["user": CartManager.shared.numberOfUser,
                                   "products": [jsonTab],"paid" : CartManager.shared.paid]
        
     
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        print(jsonData)
        let urlPath :String = FoodServer.GetBaseURL() + "orders"
        let url: URL = URL(string: urlPath)!
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
               print(responseJSON)
                    //order = self.JSONToOrder(responseJSON)
                   // completion(order)
            }
        }
        
        task.resume()
    }*/
    
   /* func JSONToOrder(_ jsonObject : Any) -> Order{
        var order : Order
        let id = (jsonObject as AnyObject).object(forKey: "_id") as! String
        let user = (jsonObject as AnyObject).object(forKey: "user") as! String
        let paid = (jsonObject as AnyObject).object(forKey: "paid") as! Bool
        (jsonObject as AnyObject).object(forKey: "paid")
        let products =
        return order
    }*/
    
}
