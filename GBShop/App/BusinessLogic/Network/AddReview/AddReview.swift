//
//  AddReviewFetch.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.09.2022.
//
import Foundation
import Alamofire
import CoreText

class AddReview: AbstractRequestFactory {
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

extension AddReview: AddReviewFactory {
    func getReviews(idUser: Int, text: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void) {
        let requestModel = AddReview(baseUrl: baseUrl, idUser: idUser, text: text)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension AddReview {
    struct AddReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "addReview"
        
        let idUser: Int
        let text: String
        
        var parameters: Parameters? {
            return [
                "id_user" : idUser,
                "text" : text
            ]
        }
    }
}
