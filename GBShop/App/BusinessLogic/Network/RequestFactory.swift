//
//  RequestFactory.swift
//  GBShop
//
//  Created by Никита Мошенцев on 09.08.2022.
//

import Foundation
import Alamofire

class RequestFactory {
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeLogoutRequestFactory() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
        return Logout(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeChangeDataUserRequsetFactory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeUserData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeRegistrationRequestFactory() -> RegistrationRequestFactory {
        let errorParser = makeErrorParser()
        return Registration(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeCatalogRequestFactory() -> CatalogRequestFactory {
        let errorParser = makeErrorParser()
        return ProductsInCatalog(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGoodRequestFactory() -> GoodRequestFactory {
        let errorParser = makeErrorParser()
        return GoodFetch(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetReviewsFactory() -> GetReviewsFactory {
        let errorParser = makeErrorParser()
        return GetReviews(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeAddReviewFactory() -> AddReviewFactory {
        let errorParser = makeErrorParser()
        return AddReview(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeDeleteReviewFactory() -> DeleteReviewFactory {
        let errorParser = makeErrorParser()
        return DeleteReview(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makePayBasketFactory() -> PayBasketFactory {
        let errorParser = makeErrorParser()
        return PayBasket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeAddToBasketFactory() -> AddToBasketFactory {
        let errorParser = makeErrorParser()
        return AddToBasket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeRemoveFromBasketFactory() -> RemoveFromBasketFactory {
        let errorParser = makeErrorParser()
        return RemoveFromBasket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
