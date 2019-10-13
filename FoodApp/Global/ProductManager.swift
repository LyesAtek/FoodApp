//
//  ModelManager.swift
//  FoodApp
//
//  Created by Lyes ATEK on 13/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import Foundation

//This class saves the result of the wb call
class ProductManager{
    
    static let sharedInstance = ProductManager()
    
    var saveProductViewModels : [ProductViewModel] = []
    
}
