//
//  ProductViewModelTests.swift
//  FoodAppTests
//
//  Created by Lyes ATEK on 13/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import XCTest
@testable import FoodApp

class ProductViewModelTests: XCTestCase {
    
    
    func testInitProductViewModel(){
        let newProduct = ProductViewModel(productId: "001", productTitle: "Burger", productDescription: "un burger", productPrice: 3, productImage: "https://www.mcdonalds.fr/image/layout_icon?img_id=567501", categoryId: "001")
        
        XCTAssertEqual("001", newProduct.productId)
        XCTAssertEqual("Burger", newProduct.productTitle)
        XCTAssertEqual("un burger", newProduct.productDescription)
         XCTAssertEqual(3, newProduct.productPrice)
        XCTAssertEqual("https://www.mcdonalds.fr/image/layout_icon?img_id=567501", newProduct.productImage)
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
