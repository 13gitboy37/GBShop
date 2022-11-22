//
//  RegistrationPresenter.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.11.2022.
//

import UIKit

protocol RegistrationViewOutput: AnyObject {
    func registrationButtonTapped(user: User, secondPassword: String)
    func goToLogin()
    func showErrorRegistration(title: String, error: String)
    func registrationSuccess(title: String, message: String)
    func textFieldDelegate(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    func startActivityIndicator()
    func stopActivityIndicator()
}

final class RegistrationPresenter {
    
    weak var registrationView: RegistrationViewInput?
    var router: RegistrationRouterProtocol
    var interactor: RegistrationInteractorProtocol
    
    init(interactor: RegistrationInteractorProtocol,
         router: RegistrationRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
}

extension RegistrationPresenter: RegistrationViewOutput {
    func textFieldDelegate(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        interactor.textFieldDelegate(textField, shouldChangeCharactersIn: range, replacementString: string)
    }
    
    func registrationButtonTapped(user: User, secondPassword: String) {
        interactor.registrationButtonTapped(user: user, secondPassword: secondPassword)
    }
    
    func registrationSuccess(title: String, message: String) {
        registrationView?.showAlertController(with: title, error: message)
    }
    
    func goToLogin() {
        router.presentLoginViewController()
    }
    
    func showErrorRegistration(title: String, error: String) {
        self.registrationView?.showAlertController(with: title, error: error)
    }
    
    func startActivityIndicator() {
        registrationView?.startShowingActivityIndicator()
    }
    
    func stopActivityIndicator() {
        registrationView?.stopShowingActivityIndicator()
    }
}


