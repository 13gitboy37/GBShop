//
//  LogoutTests.swift
//  GBShopTests
//
//  Created by Никита Мошенцев on 22.08.2022.
//

import XCTest
@testable import GBShop

class LogoutTests: XCTestCase {
    
    private let expectationLogout = XCTestExpectation(description: "Logout Testing")
    private var logout: LogoutRequestFactory!
        
    override func setUp() {
        let factory = RequestFactory()
        logout = factory.makeLogoutRequestFactory()
    }
    
    override func tearDown() {
        logout = nil
    }
    
    func testLogout() {
        
        var isRequestPassed: Bool = false
        let idUser = 123
        
        logout.logout(idUser: idUser){ [weak self] response in
            switch response.result {
            case .success(let result):
                isRequestPassed = result.result == 1 ? true : false
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationLogout.fulfill()
        }
        wait(for: [expectationLogout],
             timeout: 10.0)
        XCTAssertTrue(isRequestPassed,
                      "Logout attempt haven`t succeded")
    }
}
