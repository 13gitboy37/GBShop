//
//  CatalogTests.swift
//  GBShopTests
//
//  Created by Никита Мошенцев on 22.08.2022.
//

import XCTest
@testable import GBShop

class CatalogTests: XCTestCase {
    
    private let expectationCatalog = XCTestExpectation(description: "Registration testing")
    private var catalog: CatalogRequestFactory!
    
    
    override func setUp() {
        let factory = RequestFactory()
        catalog = factory.makeCatalogRequestFactory()
    }
    
    override func tearDown() {
        catalog = nil
    }
    
    func testRegistration() {
        var isRequestPassed: Bool = false
        let pageNumber = 1
        let idCategory = 1
        
        catalog.fetchProductsCatalog(pageNumber: pageNumber, idCategory: idCategory)
        { [weak self] response in
            switch response.result {
            case .success(let result):
                isRequestPassed = !result.isEmpty ? true : false
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
