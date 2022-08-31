//
//  Good.swift
//  GBShop
//
//  Created by Никита Мошенцев on 22.08.2022.
//

import Foundation
import Alamofire
import CoreText

class GoodFetch: AbstractRequestFactory {
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

extension GoodFetch: GoodRequestFactory {
    func fetchProductsCatalog(idProduct: Int, completionHandler: @escaping (AFDataResponse<GoodResult>) -> Void) {
        let requestModel = GoodFetch(baseUrl: baseUrl, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GoodFetch {
    struct GoodFetch: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getGood"
        
        let idProduct: Int
        var parameters: Parameters? {
            return [
                "id_product": idProduct,
            ]
        }
    }
}
