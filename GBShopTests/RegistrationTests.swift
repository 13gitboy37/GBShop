//
//  RegistrationTests.swift
//  GBShopTests
//
//  Created by Никита Мошенцев on 22.08.2022.
//

import XCTest
@testable import GBShop

class RegistrationTests: XCTestCase {

        private var registration: RegistrationRequestFactory!
        private var isRequestPassed: Bool!
        
        override func setUp() {
            let factory = RequestFactory()
            registration = factory.makeRegistrationRequestFactory()
            isRequestPassed = false
        }
        
        override func tearDown() {
            registration = nil
            isRequestPassed = nil
        }
        
        func testRegistration() {
            
            let expectationRegistration = XCTestExpectation(description: "Registration testing")
            let idUser = 123
            let userName = "Somebody"
            let password = "mypassword"
            let email = "some@some.ru"
            let gender = "m"
            let creditCard = "9872389-2424-234224-234"
            let bio = "This is good! I think I will switch to another language"
            
            registration.registration(idUser: idUser,
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
                expectationRegistration.fulfill()
            }
            wait(for: [expectationRegistration],
                 timeout: 10.0)
            XCTAssertTrue(isRequestPassed, "Registration not success")
        }
    }
