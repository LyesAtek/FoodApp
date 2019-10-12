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
    
    @IBOutlet weak var categoryTitle: UILabel!
    
    var categoryViewModel : CategoryViewModel!{
        didSet{
            categoryTitle.text = categoryViewModel.categoryTitle
            categoryImage.dowloadFromServer(imageView: categoryImage, link: categoryViewModel.categoryImage, contentMode: .scaleAspectFill)
        }
    }
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
