//
//  AuthTests.swift
//  GBShopTests
//
//  Created by Никита Мошенцев on 21.08.2022.
//

import XCTest
@testable import GBShop

class AuthTests: XCTestCase {
    
    private let expectationLogin = XCTestExpectation(description: "AuthLoginTesting")
    private var auth: AuthRequestFactory!
    
    override func setUp() {
        let factory = RequestFactory()
        auth = factory.makeAuthRequestFactory()
    }
    
    override func tearDown() {
        auth = nil
        }
    
    func testAuth() {
        
        var isRequestPassed: Bool = false
        let userName = "Somebody"
        let password = "mypassword"
        
        auth.login(userName: userName, password: password) { [weak self] response in
            switch response.result {
            case .success(let result):
                isRequestPassed = result.result == 1 ? true : false
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationLogin.fulfill()
        }
        wait(for: [expectationLogin],
             timeout: 10.0)
        XCTAssertTrue(isRequestPassed,
                      "Login attempt haven`t succeded")
    }
}
