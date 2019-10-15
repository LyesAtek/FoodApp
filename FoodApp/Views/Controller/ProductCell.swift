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
    
    
    
    public var indexPath:IndexPath!
    var cellDelegate: ProductCellDelegate?
   
    @IBOutlet weak var productTitle: UILabel!
    
    @IBOutlet weak var commandButton: UIButton!
   
    var productViewModel : ProductViewModel!{
        didSet{
            productImage.dowloadFromServer(imageView: productImage, link: productViewModel.productImage, contentMode: .scaleAspectFill)
            productTitle.text = productViewModel.productTitle
            let commandButtonText = String(format: "%.2f", productViewModel.productPrice) + " €"
            commandButton.setTitle(commandButtonText, for: .normal)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    @IBAction func commandButtonCanceled(_ sender: Any) {
         self.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
    }
    
    
    @IBAction func commandButtonPressed(_ sender: Any) {
         self.backgroundColor = UIColor(red: 11/255, green: 66/255, blue: 15/255, alpha: 1)
        
    }
    
    @IBAction func commandButtonTouchUpInside(_ sender: UIButton) {
        self.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        cellDelegate?.didPressButton(sender.tag,productViewModel: productViewModel)
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
protocol ProductCellDelegate : class {
    func didPressButton(_ tag: Int,productViewModel : ProductViewModel)
}
