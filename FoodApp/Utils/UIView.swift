//
//  UIView.swift
//  FoodApp
//
//  Created by Lyes ATEK on 14/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit

extension UIView{
    func roundedUIViewBottom(){
        let maskPath = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.bottomLeft , .bottomRight],
                                     cornerRadii: CGSize(width: 10, height: 10))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
    func roundedUIView(){
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
}
