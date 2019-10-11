//
//  MainViewController.swift
//  FoodApp
//
//  Created by Lyes ATEK on 11/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit

class MainViewController : UIViewController{
    var categoryViewModel = CategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GetCategories()
    }
    
    func GetCategories(){
        WBCategory.shared.GetCategories(){
            (result : Data) in
            self.categoryViewModel.GetCategories(data: result)
        }
    }
    
}
