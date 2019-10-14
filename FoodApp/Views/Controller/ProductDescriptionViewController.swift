//
//  ProductDescriptionViewController.swift
//  FoodApp
//
//  Created by Lyes ATEK on 14/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit


class ProductDescriptionViewController : UIViewController{
    
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closeButton.layer.cornerRadius = 10
        closeButton.layer.masksToBounds = true
        popUpView.layer.cornerRadius = 10
        popUpView.layer.masksToBounds = true
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
}
