//
//  CategoryTests.swift
//  FoodAppTests
//
//  Created by Lyes ATEK on 12/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import XCTest
@testable import FoodApp

class CategoryTests: XCTestCase {

    func testInitCategory(){
         let newCategory = FoodApp.Category(id: "001", tittle: "Burgers", creation: "currentDate", image: "image")
        
        XCTAssertEqual("001", newCategory._id)
        XCTAssertEqual("Burgers", newCategory.title)
        XCTAssertEqual("currentDate", newCategory.creation)
        XCTAssertEqual("image", newCategory.image)
    }

}
