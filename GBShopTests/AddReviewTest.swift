//
//  AddReviewTest.swift
//  GBShopTests
//
//  Created by Никита Мошенцев on 01.09.2022.
//

import XCTest
@testable import GBShop

class AddReviewTests: XCTestCase {
    
    private let expectationAddReview = XCTestExpectation(description: "Add Review testing")
    private var addReview: AddReviewFactory!
    
    override func setUp() {
        let factory = RequestFactory()
        addReview = factory.makeAddReviewFactory()
    }
    
    override func tearDown() {
        addReview = nil
        }
    
    func testAddReview() {
        
        var isRequestPassed: Bool = false
        let idUser = 123
        let text = "123"
        
        addReview.getReviews(idUser: idUser, text: text) { [weak self] response in
            switch response.result {
            case .success(let review):
                isRequestPassed = review.result == 1 ? true : false
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationAddReview.fulfill()
        }
        wait(for: [expectationAddReview],
             timeout: 10.0)
        XCTAssertTrue(isRequestPassed, "Add review haven`t succeded")
    }
}
