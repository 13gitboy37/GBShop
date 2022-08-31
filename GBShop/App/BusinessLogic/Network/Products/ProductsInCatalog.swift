//
//  Catalog.swift
//  GBShop
//
//  Created by Никита Мошенцев on 22.08.2022.
//

import Foundation
import Alamofire
import CoreText

class ProductsInCatalog: AbstractRequestFactory {
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

extension ProductsInCatalog: CatalogRequestFactory {
    func fetchProductsCatalog(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<CatalogResult>) -> Void) {
        let requestModel = ProductsInCatalog(baseUrl: baseUrl, pageNumber: pageNumber, idCategory: idCategory)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ProductsInCatalog {
    struct ProductsInCatalog: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getCatalog"
        
        let pageNumber: Int
        let idCategory: Int
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": idCategory,
            ]
        }
    }
}
