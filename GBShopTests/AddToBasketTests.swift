//
//  AddToBasketTests.swift
//  GBShopTests
//
//  Created by Никита Мошенцев on 09.09.2022.
//

import XCTest
@testable import GBShop

class AddToBasketTests: XCTestCase {
    
    private let expectationAddToBasket = XCTestExpectation(description: "Add to basket testing")
    private var addToBasket: AddToBasketFactory!
    
    override func setUp() {
        let factory = RequestFactory()
        addToBasket = factory.makeAddToBasketFactory()
    }
    
    override func tearDown() {
        addToBasket = nil
        }
    
    func testAddToBasket() {
        
        var isRequestPassed: Bool = false
        let idProduct = 123
        let quantity = 3
        
        addToBasket.addToBasket(idProduct: idProduct, quantity: quantity) { [weak self] response in
            switch response.result {
            case .success(let addToBasket):
                isRequestPassed = addToBasket.result == 1 ? true : false
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationAddToBasket.fulfill()
        }
        wait(for: [expectationAddToBasket],
             timeout: 10.0)
        XCTAssertTrue(isRequestPassed, "Add to basket haven`t succeded")
    }
}
