//
//  ChangeUserDataTests.swift
//  GBShopTests
//
//  Created by Никита Мошенцев on 22.08.2022.
//

import XCTest
@testable import GBShop

class ChangeUserDataTests: XCTestCase {
    
    private let expectationChangeUserData = XCTestExpectation(description: "Change user data testing")
    private var changeUserData: ChangeUserDataRequestFactory!
    private var isRequestPassed: Bool!
    
    override func setUp() {
        let factory = RequestFactory()
        changeUserData = factory.makeChangeDataUserRequsetFactory()
        isRequestPassed = false
    }
    
    override func tearDown() {
        changeUserData = nil
        isRequestPassed = nil
    }
    
    func testChangeUserData() {
        let idUser = 123
        let userName = "Somebody"
        let password = "mypassword"
        let email = "some@some.ru"
        let gender = "m"
        let creditCard = "9872389-2424-234224-234"
        let bio = "This is good! I think I will switch to another language"
        
        changeUserData.changeUserData(idUser: idUser,
                                      userName: userName,
                                      password: password,
                                      email: email,
                                      gender: gender,
                                      creditCard: creditCard, bio: bio)
        { [weak self] response in
            switch response.result {
            case .success(let result):
                self?.isRequestPassed = result.result == 1 ? true : false
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationChangeUserData.fulfill()
        }
        wait(for: [expectationChangeUserData],
             timeout: 10.0)
        XCTAssertTrue(isRequestPassed, "Change user data not success")
    }
}
