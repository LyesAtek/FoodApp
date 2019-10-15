//
//  CartFootTableView.swift
//  FoodApp
//
//  Created by Lyes ATEK on 15/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit

class CartFooterTableView: UIView{
    
    @IBOutlet weak var totalPrice: UILabel!
    
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "CartFooterTableView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    
}
