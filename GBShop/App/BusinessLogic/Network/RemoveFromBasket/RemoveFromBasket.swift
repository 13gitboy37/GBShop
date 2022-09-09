//
//  RemoveFromBasket.swift
//  GBShop
//
//  Created by Никита Мошенцев on 09.09.2022.
//

import Foundation

import Foundation
import Alamofire
import CoreText

class RemoveFromBasket: AbstractRequestFactory {
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

extension RemoveFromBasket: RemoveFromBasketFactory {
    func removeFromBasket(idProduct: Int, completionHandler: @escaping (AFDataResponse<RemoveFromBasketResult>) -> Void) {
        let requestModel = RemoveFromBasket(baseUrl: baseUrl, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension RemoveFromBasket {
    struct RemoveFromBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "removeFromBasket"
        
        let idProduct: Int
        
        var parameters: Parameters? {
            return [
                "id_product" : idProduct
            ]
        }
    }
}
