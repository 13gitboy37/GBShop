//
//  DeleteReviewTest.swift
//  GBShopTests
//
//  Created by Никита Мошенцев on 01.09.2022.
//

import XCTest
@testable import GBShop

class DeleteReviewTests: XCTestCase {
    
    private let expectationDeleteReview = XCTestExpectation(description: "Delete Review testing")
    private var deleteReview: DeleteReviewFactory!
    
    override func setUp() {
        let factory = RequestFactory()
        deleteReview = factory.makeDeleteReviewFactory()
    }
    
    override func tearDown() {
        deleteReview = nil
        }
    
    func testDeleteReviews() {
        
        var isRequestPassed: Bool = false
        let idComment = 123
        
        deleteReview.deleteReview(idComment: idComment) { [weak self] response in
            switch response.result {
            case .success(let review):
                isRequestPassed = review.result == 1 ? true : false
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationDeleteReview.fulfill()
        }
        wait(for: [expectationDeleteReview],
             timeout: 10.0)
        XCTAssertTrue(isRequestPassed, "Delete review haven`t succeded")
    }
}
