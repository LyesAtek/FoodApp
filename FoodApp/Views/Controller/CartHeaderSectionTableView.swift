//
//  CartHeaderTableView.swift
//  FoodApp
//
//  Created by Lyes ATEK on 15/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit

class CartHeaderSectionTableView : UIView{
    
    @IBOutlet weak var sectionTitle: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "CartHeaderSectionTableView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
}
