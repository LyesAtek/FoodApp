//
//  CategoryCell.swift
//  FoodApp
//
//  Created by Lyes ATEK on 12/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit


class CategoryCell : UICollectionViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    
    @IBOutlet weak var categoryButton: UIButton!
    
    weak var delegate : CategoryCell?
    
    var categoryViewModel : CategoryViewModel!{
        didSet{
            categoryButton.setTitle( categoryViewModel.categoryTitle, for: .normal)
            categoryImage.dowloadFromServer(imageView: categoryImage, link: categoryViewModel.categoryImage, contentMode: .scaleAspectFill)
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
