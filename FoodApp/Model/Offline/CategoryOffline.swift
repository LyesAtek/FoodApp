//
//  CategoryOffline.swift
//  FoodApp
//
//  Created by Lyes ATEK on 14/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import Foundation
import CoreData

class CategoryOffline : NSManagedObject{
    
    static var categories : [CategoryOffline] {
        let request: NSFetchRequest<CategoryOffline> = CategoryOffline.fetchRequest()
        guard let categories = try? AppDelegate.viewContext.fetch(request) else {
            return []
        }
        return categories
    }
    
    static func transformToCategoriesViewModel(categoriesOffline: [CategoryOffline])->[CategoryViewModel]{
        var categoriesViewModel : [CategoryViewModel] = []
        
        for categoryOffline in categoriesOffline{
            let categoryViewModel = CategoryViewModel(id: categoryOffline.categoryId!, title: categoryOffline.categoryTitle!, image: categoryOffline.categoryImage!)
            categoriesViewModel.append(categoryViewModel)
        }
        return categoriesViewModel
    }
    
    static func saveCategories(categories : [CategoryViewModel]){
        for category in categories{
            
            let categoryOffline = CategoryOffline(context: AppDelegate.persistentContainer.viewContext)
            categoryOffline.categoryId = category.categoryId
            categoryOffline.categoryTitle = category.categoryTitle
            categoryOffline.categoryImage = category.categoryImage
            
            do{
                try  AppDelegate.persistentContainer.viewContext.save()
            }catch{
                print("Error saving context: \(error)")
            }
            
        }
    }
    
    
}

