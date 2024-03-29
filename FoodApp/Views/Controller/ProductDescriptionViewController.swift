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
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productDescription: UITextView!
       
    @IBOutlet weak var productTitle: UILabel!
    
        
    var productViewModel : ProductViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productDescription.text = productViewModel.productDescription
         productImage.dowloadFromServer(imageView: productImage, link: productViewModel.productImage, contentMode: .scaleAspectFill)
        productTitle.text = productViewModel.productTitle
        popUpView.roundedUIView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
  
    @IBAction func closePopUp(_ sender: Any) {
        
        dismiss(animated: false, completion: nil)
    }
    
    
}
