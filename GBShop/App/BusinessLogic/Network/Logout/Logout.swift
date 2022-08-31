//
//  Logout.swift
//  GBShop
//
//  Created by Никита Мошенцев on 10.08.2022.
//

import Foundation
import Alamofire
import CoreText

class Logout: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://pacific-brushlands-23583.herokuapp.com")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
    }
}

extension Logout: LogoutRequestFactory {
    func logout(idUser: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let requestModel = Logout(baseUrl: baseUrl, idUser: 123)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Logout {
    struct Logout: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "logout"
        
        let idUser: Int
        var parameters: Parameters? {
            return [
                "id_user": idUser,
            ]
        }
    }
}

