//
//  FoodServer.swift
//  FoodApp
//
//  Created by Lyes ATEK on 11/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import Foundation

class FoodServer {
   static let baseURL : String = "https://simple-food-app.herokuapp.com/"
    
    static func GetBaseURL()->String {
        return baseURL
    }
}
