//
//  ProductCell.swift
//  FoodApp
//
//  Created by Lyes ATEK on 13/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit

class ProductCell : UICollectionViewCell{
    
    @IBOutlet weak var productImage: UIImageView!
    
   
    @IBOutlet weak var productTitle: UILabel!
    
    @IBOutlet weak var commandButton: UIButton!
   
    var productViewModel : ProductViewModel!{
        didSet{
            productImage.dowloadFromServer(imageView: productImage, link: productViewModel.productImage, contentMode: .scaleAspectFill)
            productTitle.text = productViewModel.productTitle
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
