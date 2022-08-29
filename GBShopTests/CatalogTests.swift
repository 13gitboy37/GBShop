//
//  CatalogTests.swift
//  GBShopTests
//
//  Created by Никита Мошенцев on 22.08.2022.
//

import XCTest
@testable import GBShop

class CatalogTests: XCTestCase {
    
    private var catalog: CatalogRequestFactory!
    private var isRequestPassed: Bool!
    
    override func setUp() {
        let factory = RequestFactory()
        catalog = factory.makeCatalogRequestFactory()
        isRequestPassed = false
    }
    
    override func tearDown() {
        catalog = nil
        isRequestPassed = nil
    }
    
    func testRegistration() {
        
        let expectationCatalog = XCTestExpectation(description: "Registration testing")
        let pageNumber = 1
        let idCategory = 1
        
        catalog.fetchProductsCatalog(pageNumber: pageNumber, idCategory: idCategory)
        { [weak self] response in
            switch response.result {
            case .success(let result):
                self?.isRequestPassed = !result.isEmpty ? true : false
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationCatalog.fulfill()
        }
        wait(for: [expectationCatalog],
             timeout: 10.0)
        XCTAssertTrue(isRequestPassed, "Get catalog not success")
    }
}
