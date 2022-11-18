//
//  Registration.swift
//  GBShop
//
//  Created by Никита Мошенцев on 10.08.2022.
//

import Foundation
import Alamofire
import CoreText

class Registration: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://pacific-brushlands-23583.herokuapp.com")!
//    let baseUrl = URL(string: "http://127.0.0.1:8080")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
    }
}

extension Registration: RegistrationRequestFactory {
    
    func registration(idUser: Int,
                      userName: String,
                      password: String,
                      email: String,
                      gender: String,
                      creditCard: String,
                      bio: String,
                      completionHandler: @escaping (AFDataResponse<RegistrationResult>) -> Void) {
        let requestModel = Registration(baseUrl: baseUrl, idUser: idUser, login: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Registration {
    struct Registration: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "registration"
        
        let idUser: Int
        let login: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        
        var parameters: Parameters? {
            return [
                "id_user": idUser,
                "username": login,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }
}
