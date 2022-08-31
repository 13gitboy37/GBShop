//
//  RegistrationTests.swift
//  GBShopTests
//
//  Created by Никита Мошенцев on 22.08.2022.
//

import XCTest
@testable import GBShop

class RegistrationTests: XCTestCase {

        private let expectationRegistration = XCTestExpectation(description: "Registration testing")
        private var registration: RegistrationRequestFactory!
        
        override func setUp() {
            let factory = RequestFactory()
            registration = factory.makeRegistrationRequestFactory()
        }
        
        override func tearDown() {
            registration = nil
        }
        
        func testRegistration() {
            
            var isRequestPassed: Bool = false
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
                    isRequestPassed = result.result == 1 ? true : false
                    break
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                }
                self?.expectationRegistration.fulfill()
            }
            wait(for: [expectationRegistration],
                 timeout: 10.0)
            XCTAssertTrue(isRequestPassed, "Registration not success")
        }
    }
