//
//  ChangeUserData.swift
//  GBShop
//
//  Created by Никита Мошенцев on 10.08.2022.
//

import Foundation
import Alamofire
import CoreText

class ChangeUserData: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
    }
}

extension ChangeUserData: ChangeUserDataRequestFactory {
    func changeUserData(idUser: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void) {
        let requestModel = ChangeUserDataModel(baseUrl: baseUrl, idUser: idUser, login: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ChangeUserData {
    struct ChangeUserDataModel: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
        
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
