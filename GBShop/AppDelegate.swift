//
//  AppDelegate.swift
//  GBShop
//
//  Created by Никита Мошенцев on 02.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let requestFactory = RequestFactory()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let auth = requestFactory.makeAuthRequestFactory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let logout = requestFactory.makeLogoutRequestFactory()
        logout.logout(idUser: 123) { response in
            switch response.result {
            case .success(let logout):
                print(logout)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let changeUserData = requestFactory.makeChangeDataUserRequsetFactory()
        changeUserData.changeUserData(idUser: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let changeUserData):
                print(changeUserData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let registration = requestFactory.makeRegistrationRequestFactory()
        registration.registration(idUser: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let registration):
                print(registration)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let catalog = requestFactory.makeCatalogRequestFactory()
        catalog.fetchProductsCatalog(pageNumber: 1, idCategory: 1) { response in
            switch response.result {
            case .success(let catalog):
                print(catalog)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let good = requestFactory.makeGoodRequestFactory()
        good.fetchProductsCatalog(idProduct: 123) { response in
            switch response.result {
            case .success(let good):
                print(good)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let getReviews = requestFactory.makeGetReviewsFactory()
        getReviews.getReviews(idProduct: 123, idUser: 123) { response in
            switch response.result {
            case .success(let reviews):
                print(reviews)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let addReview = requestFactory.makeAddReviewFactory()
        addReview.getReviews(idUser: 123, text: "Отличный товар") { response in
            switch response.result {
            case .success(let review):
                print(review)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let deleteReview = requestFactory.makeDeleteReviewFactory()
        deleteReview.deleteReview(idComment: 123) { response in
            switch response.result {
            case .success(let removableReview):
                print(removableReview)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let payBasket = requestFactory.makePayBasketFactory()
        payBasket.payBasket(idUser: 123) { response in
            switch response.result {
            case .success(let payBasketResult):
                print(payBasketResult)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let addToBasket = requestFactory.makeAddToBasketFactory()
        addToBasket.addToBasket(idProduct: 123, quantity: 1) { response in
            switch response.result {
            case .success(let addToBasket):
                print(addToBasket)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let removeFromBasket = requestFactory.makeRemoveFromBasketFactory()
        removeFromBasket.removeFromBasket(idProduct: 123) { response in
            switch response.result {
            case .success(let removeFromBasket):
                print(removeFromBasket)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        return true
    }
}


