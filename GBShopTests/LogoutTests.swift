//
//  LogoutTests.swift
//  GBShopTests
//
//  Created by Никита Мошенцев on 22.08.2022.
//

import XCTest
@testable import GBShop

class LogoutTests: XCTestCase {
    
    private var logout: LogoutRequestFactory!
    private var isRequestPassed: Bool!
    
    override func setUp() {
        let factory = RequestFactory()
        logout = factory.makeLogoutRequestFactory()
        isRequestPassed = false
    }
    
    override func tearDown() {
        logout = nil
        isRequestPassed = nil
    }
    
    func testLogout() {
        
        let expectationLogout = XCTestExpectation(description: "LogoutTesting")
        let idUser = 123
        
        logout.logout(idUser: idUser){ [weak self] response in
            switch response.result {
            case .success(let result):
                self?.isRequestPassed = result.result == 1 ? true : false
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectationLogout.fulfill()
        }
        wait(for: [expectationLogout],
             timeout: 10.0)
        XCTAssertTrue(isRequestPassed,
                      "Logout attempt haven`t succeded")
    }
}
