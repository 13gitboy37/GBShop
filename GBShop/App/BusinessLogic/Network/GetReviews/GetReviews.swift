//
//  GetReviews.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.09.2022.
//

import Foundation
import Alamofire
import CoreText

class GetReviews: AbstractRequestFactory {
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

extension GetReviews: GetReviewsFactory {
    func getReviews(idProduct: Int, idUser: Int, completionHandler: @escaping (AFDataResponse<GetReviewsResult>) -> Void) {
        let requestModel = GetReviews(baseUrl: baseUrl, idProduct: idProduct, idUser: idUser)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetReviews {
    struct GetReviews: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getReviews"
        
        let idProduct: Int
        let idUser: Int
        var parameters: Parameters? {
            return [
                "id_product" : idProduct,
                "id_user" : idUser
            ]
        }
    }
}

