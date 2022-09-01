//
//  GetReviewsTest.swift
//  GBShopTests
//
//  Created by Никита Мошенцев on 01.09.2022.
//

import XCTest
@testable import GBShop

class GetReviewsTests: XCTestCase {
    
    private let expectationGetReviews = XCTestExpectation(description: "Add Review testing")
    private var getReviews: GetReviewsFactory!
    
    override func setUp() {
        let factory = RequestFactory()
        getReviews = factory.makeGetReviewsFactory()
    }
    
    override func tearDown() {
        getReviews = nil
        }
    
    func testGetReviews() {
        
        var isRequestPassed: Bool = false
        let idUser = 123
        let idProduct = 123
        
        getReviews.getReviews(idProduct: idProduct, idUser: idUser) { [weak self] response in
            switch response.result {
            case .success(let result):
                isRequestPassed = result.result == 1 ? true : false
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationGetReviews.fulfill()
        }
        wait(for: [expectationGetReviews],
             timeout: 10.0)
        XCTAssertTrue(isRequestPassed,
                      "Get Reviews haven`t succeded")
    }
}
