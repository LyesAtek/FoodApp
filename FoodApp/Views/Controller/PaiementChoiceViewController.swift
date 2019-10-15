//
//  PaiementChoiceViewController.swift
//  FoodApp
//
//  Created by Lyes ATEK on 15/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit

class PaiementChoiceViewController : UIViewController{
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override  func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cashButtonPressed(_ sender: Any) {
        activityIndicator.startAnimating()
        CartManager.shared.paid = false
        let homeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    @IBAction func bankCardButtonPressed(_ sender: Any) {
        CartManager.shared.paid = true
        let homeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    
  
    
}
