//
//  GoodTests.swift
//  GBShopTests
//
//  Created by Никита Мошенцев on 22.08.2022.
//

import XCTest
@testable import GBShop

class GoodTests: XCTestCase {
    
    private let expectationGood = XCTestExpectation(description: "Good fetch testing")
    private var good: GoodRequestFactory!
    
    
    override func setUp() {
        let factory = RequestFactory()
        good = factory.makeGoodRequestFactory()
    }
    
    override func tearDown() {
        good = nil
    }
    
    func testFetchGoods() {
        var isRequestPassed: Bool = false
        let idProduct = 123
        
        good.fetchProductsCatalog(idProduct: idProduct) { [weak self] response in
            switch response.result {
            case .success(let result):
                isRequestPassed = result.result == 1 ? true : false
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationGood.fulfill()
        }
            wait(for: [expectationGood],
                 timeout: 10.0)
            XCTAssertTrue(isRequestPassed, "Get catalog not success")
        }
}
