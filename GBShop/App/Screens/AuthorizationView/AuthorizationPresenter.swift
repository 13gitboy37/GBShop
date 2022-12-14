//
//  AuthorizationPresenter.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.11.2022.
//

import Foundation

protocol AuthViewOutput: AnyObject {
    func loginButtonTapped(login: String, password: String)
    func registrationButtonTapped()
    func loginSuccess()
    func showErrorLogin(error: String)
    func startActivityIndicator()
    func stopActivityIndicator()
}

final class AuthPresenter {
    
    weak var authorizationView: AuthViewInput?
    var router: AuthRouterProtocol
    var interactor: AuthInteractorProtocol
    
    init(interactor: AuthInteractorProtocol,
         router: AuthRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
}

extension AuthPresenter: AuthViewOutput {
    func loginButtonTapped(login: String, password: String) {
        interactor.loginButtonTapped(login: login, password: password)
    }
    
    func loginSuccess() {
        router.presentShopViewController()
    }
    
    func showErrorLogin(error: String) {
        authorizationView?.showAlertController(with: error)
    }
    
    func registrationButtonTapped() {
        router.presentRegistrationViewController()
    }
    
    func startActivityIndicator() {
        authorizationView?.startShowingActivityIndicator()
    }
    
    func stopActivityIndicator() {
        authorizationView?.stopShowingActivityIndicator()
    }
}


