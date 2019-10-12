//
//  CategoryCellTests.swift
//  FoodAppTests
//
//  Created by Lyes ATEK on 12/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import XCTest
@testable import FoodApp

class CategoryCellTests: XCTestCase {
     var controller: MainViewController!
    let cellReuseIdentifier = "CategoryCell"
    override func setUp() {
        super.setUp()
        
        controller = MainViewController()
        _ = controller.view.description
    }
    
    override func tearDown() {
        super.tearDown()
        controller = nil
    }
    
    func testCollectionViewOutlet() {
        XCTAssertNotNil(controller.collectionView)
    }
    
    func testCollectionViewCell() {
        let indexPath = NSIndexPath(row: 0, section: 0)
        let newCategory = FoodApp.Category(id: "001", tittle: "Burgers", creation: "currentDate", image: "https://www.mcdonalds.fr/image/layout_icon?img_id=567501")
        
        let cell : CategoryCell = controller.collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier , for: indexPath as IndexPath) as! CategoryCell
        
        let categoryViewModel = CategoryViewModel(category: newCategory)
        
        
        cell.categoryViewModel = categoryViewModel
        XCTAssertEqual("001", cell.categoryViewModel.categoryId)
        XCTAssertEqual("Burgers", cell.categoryViewModel.categoryTitle)
        XCTAssertEqual("https://www.mcdonalds.fr/image/layout_icon?img_id=567501", cell.categoryViewModel.categoryImage)
        XCTAssertEqual(cell.categoryTitle.text!, "Burgers")
        
    }
    
}
