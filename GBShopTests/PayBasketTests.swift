//
//  PayBasketTests.swift
//  GBShopTests
//
//  Created by Никита Мошенцев on 09.09.2022.
//

import XCTest
@testable import GBShop

class PayBasketTests: XCTestCase {
    
    private let expectationPayBasket = XCTestExpectation(description: "Pay basket testing")
    private var payBasket: PayBasketFactory!
    
    override func setUp() {
        let factory = RequestFactory()
        payBasket = factory.makePayBasketFactory()
    }
    
    override func tearDown() {
        payBasket = nil
        }
    
    func testPayBasket() {
        
        var isRequestPassed: Bool = false
        let idUser = 123
        
        payBasket.payBasket(idUser: idUser) { [weak self] response in
            switch response.result {
            case .success(let payBasket):
                isRequestPassed = payBasket.countGoods > 0 ? true : false
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationPayBasket.fulfill()
        }
        wait(for: [expectationPayBasket],
             timeout: 10.0)
        XCTAssertTrue(isRequestPassed, "Pay basket haven`t succeded")
    }
}
