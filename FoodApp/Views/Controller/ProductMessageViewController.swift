//
//  ProductMessageViewController.swift
//  FoodApp
//
//  Created by Lyes ATEK on 15/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit

class ProductMessageViewController : UIViewController{
    
    
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productTitle: UILabel!
    
    
    var productViewModel : ProductViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productImage.dowloadFromServer(imageView: productImage, link: productViewModel.productImage, contentMode: .scaleAspectFill)
        productTitle.text = productViewModel.productTitle
        popUpView.roundedUIView()
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    
    
}
