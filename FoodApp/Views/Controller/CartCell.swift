//
//  CartCell.swift
//  FoodApp
//
//  Created by Lyes ATEK on 15/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit

class CartCell : UITableViewCell{
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productTitle: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    
    var productViewModel : ProductViewModel!{
        didSet{
            productTitle.text = productViewModel.productTitle
            productPrice.text = String(format: "%.2f", productViewModel.productPrice) + " €"
            productImage.dowloadFromServer(imageView: productImage, link: productViewModel.productImage, contentMode: .scaleAspectFill)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
