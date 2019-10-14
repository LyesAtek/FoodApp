//
//  ProductOffline.swift
//  FoodApp
//
//  Created by Lyes ATEK on 13/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class ProductOffline : NSManagedObject{
    
    static var products : [ProductOffline] {
        let request: NSFetchRequest<ProductOffline> = ProductOffline.fetchRequest()
        guard let products = try? AppDelegate.viewContext.fetch(request) else {
            return []
        }
        return products
    }
    
    static func getProductsByCategoryId(categoryId : String) -> [ProductViewModel]{
        let request: NSFetchRequest<ProductOffline> = ProductOffline.fetchRequest()
        request.predicate = NSPredicate(format: "categoryId == %@", categoryId)
        
        guard let productsByCategoryId = try? AppDelegate.viewContext.fetch(request) else {
            return []
        }
        return self.transformToProductsViewModel(productsOffline: productsByCategoryId)
    }
    
    
    static func transformToProductsViewModel(productsOffline : [ProductOffline])->[ProductViewModel]{
        var productsViewModel : [ProductViewModel] = []
        for product in productsOffline{
            let productViewModel = ProductViewModel(productId : product.productId!, productTitle : product.productTitle!, productDescription : product.productDescription!, productPrice : product.productPrice, productImage: product.productImage!, categoryId : product.categoryId)
            productsViewModel.append(productViewModel)
        }
        return productsViewModel
    }
        
    static func saveProducts(products : [ProductViewModel]){
        for product in products{
            let productOffline = ProductOffline(context: AppDelegate.persistentContainer.viewContext)
            productOffline.productId = product.productId
            productOffline.productTitle = product.productTitle
            productOffline.productDescription = product.productDescription
            productOffline.productImage = product.productImage
            productOffline.productPrice = product.productPrice
            productOffline.categoryId = product.categoryId
            do{
                try  AppDelegate.persistentContainer.viewContext.save()
            }catch{
                print("Error saving context: \(error)")
            }
        }
    }
  
}

