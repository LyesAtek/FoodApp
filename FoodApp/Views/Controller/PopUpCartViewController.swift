//
//  PopUpCartViewController.swift
//  FoodApp
//
//  Created by Lyes ATEK on 16/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit

class PopUpCartViewController : UIViewController{
    
    @IBOutlet weak var popUpView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
}
