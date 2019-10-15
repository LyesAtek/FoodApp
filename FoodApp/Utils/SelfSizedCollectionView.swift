//
//  SelfSizedCollectionView.swift
//  FoodApp
//
//  Created by Lyes ATEK on 14/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit

class SelfSizedCollectionView: UICollectionView {
    var maxHeight: CGFloat = UIScreen.main.bounds.size.height
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
    
    override var intrinsicContentSize: CGSize {
        let height = min(contentSize.height, maxHeight)
        return CGSize(width: contentSize.width, height: height)
    }
}
