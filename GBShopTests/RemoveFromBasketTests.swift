//
//  RemoveFromBasketTests.swift
//  GBShopTests
//
//  Created by Никита Мошенцев on 09.09.2022.
//

import XCTest
@testable import GBShop

class RemoveFromBasketTests: XCTestCase {
    
    private let expectationRemoveFromBasket = XCTestExpectation(description: "Remove from basket testing")
    private var removeFromBasket: RemoveFromBasketFactory!
    
    override func setUp() {
        let factory = RequestFactory()
        removeFromBasket = factory.makeRemoveFromBasketFactory()
    }
    
    override func tearDown() {
        removeFromBasket = nil
        }
    
    func testRemoveFromBasket() {
        
        var isRequestPassed: Bool = false
        let idProduct = 123
        
        removeFromBasket.removeFromBasket(idProduct: idProduct) { [weak self] response in
            switch response.result {
            case .success(let removeFromBasket):
                isRequestPassed = removeFromBasket.result == 1 ? true : false
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationRemoveFromBasket.fulfill()
        }
        wait(for: [expectationRemoveFromBasket],
             timeout: 10.0)
        XCTAssertTrue(isRequestPassed, "Remove from basket haven`t succeded")
    }
}
