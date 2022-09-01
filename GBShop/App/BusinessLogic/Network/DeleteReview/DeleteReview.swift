//
//  DeleteReview.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.09.2022.
//

import Foundation
import Alamofire
import CoreText

class DeleteReview: AbstractRequestFactory {
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

extension DeleteReview: DeleteReviewFactory {
    func deleteReview(idComment: Int, completionHandler: @escaping (AFDataResponse<DeleteReviewResult>) -> Void) {
        let requestModel = DeleteReview(baseUrl: baseUrl, idComment: idComment)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension DeleteReview {
    struct DeleteReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "removeReview"
        
        let idComment: Int
        
        var parameters: Parameters? {
            return [
                "id_comment" : idComment
            ]
        }
    }
}
