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
    
    func CreateOrder(paid : Bool,orderViewModel : OrderViewModel,_ completion: @escaping () -> Void){
       // var order : Order
        let json: [String: Any] = ["user": orderViewModel.userPhone,
                                   "products":  orderViewModel.orderProducts,"paid": paid]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        let urlPath :String = FoodServer.GetBaseURL() + "categories"
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
    }
    
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
