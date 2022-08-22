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

extension GoodFetch: GoodRequestFactory {
    func fetchProductsCatalog(idProduct: Int, completionHandler: @escaping (AFDataResponse<GoodResult>) -> Void) {
        let requestModel = GoodFetch(baseUrl: baseUrl, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GoodFetch {
    struct GoodFetch: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById.json"
        
        let idProduct: Int
        var parameters: Parameters? {
            return [
                "id_product": idProduct,
            ]
        }
    }
}
