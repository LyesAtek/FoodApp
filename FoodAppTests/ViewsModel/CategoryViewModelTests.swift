//
//  CategoryViewModelTest.swift
//  FoodAppTests
//
//  Created by Lyes ATEK on 12/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import XCTest
@testable import FoodApp

class CategoryViewModelTests: XCTestCase {

    
    func testInitCategoryViewModel(){
        let newCategory = FoodApp.Category(id: "001", tittle: "Burgers", creation: "currentDate", image: "https://www.mcdonalds.fr/image/layout_icon?img_id=567501")
        
        let categoryViewModel = CategoryViewModel(category: newCategory)
        
        
        XCTAssertEqual("001", categoryViewModel.categoryId)
        XCTAssertEqual("Burgers", categoryViewModel.categoryTitle)
        XCTAssertEqual("https://www.mcdonalds.fr/image/layout_icon?img_id=567501", categoryViewModel.categoryImage)
    }
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
