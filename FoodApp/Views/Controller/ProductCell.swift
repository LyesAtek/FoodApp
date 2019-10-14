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
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes{
        
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        return layoutAttributes
        
    }
    
}
