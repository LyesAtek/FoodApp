//
//  HomeViewController.swift
//  FoodApp
//
//  Created by Lyes ATEK on 12/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit

class HomeViewController : UITabBarController,UITabBarControllerDelegate{
    
    var categoryTabNavigationController : UINavigationController!
    var cartTabNavigationControoller : UINavigationController!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Initialize Views
        categoryTabNavigationController = UINavigationController.init(rootViewController: CategoryViewController())
        cartTabNavigationControoller = UINavigationController.init(rootViewController: CartViewController())
        self.viewControllers = [categoryTabNavigationController, cartTabNavigationControoller]
     
        
        
        //Initialize item
        let categoryItem = UITabBarItem(title: "La Carte", image: nil,tag: 0)
        let cartItem = UITabBarItem(title: "Le Panier", image: nil, tag: 1)
        
        categoryTabNavigationController.tabBarItem = categoryItem
        cartTabNavigationControoller.tabBarItem = cartItem
    }
    
   
}
