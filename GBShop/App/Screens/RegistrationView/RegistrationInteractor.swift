//
//  RegistrationInteractor.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.11.2022.
//

import UIKit

protocol RegistrationInteractorProtocol {
    func registrationButtonTapped(user: User, secondPassword: String)
    
    func textFieldDelegate(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
}

final class RegistrationInteractor {
    weak var presenter: RegistrationViewOutput?
    
    private var textCount = 4
    
    let networkService: RegistrationRequestFactory
    
    init(networkService: RegistrationRequestFactory) {
        self.networkService = networkService
    }
}

extension RegistrationInteractor: RegistrationInteractorProtocol {
    
    func textFieldDelegate(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard
            let text = textField.text
        else { return false }
        let numberOfChars = 19
        setupTextCount(text: text)
        if text.count == textCount && string != "" && text.count < numberOfChars {
            textField.text = text + "-"
            return false
        }
        
        let length = !string.isEmpty ? text.count + 1 : text.count - 1
        if length > numberOfChars {
            return false
        }
        return true
    }
    
    
    func registrationButtonTapped(user: User, secondPassword: String) {
        
        let titleForAlertController = "Error"
        
        guard
            user.email != ""
        else {
            self.presenter?.showErrorRegistration(title: titleForAlertController, error: "E-mail can`t be empty!")
            return
        }
        
        guard
            user.email.contains("@")
        else {
            self.presenter?.showErrorRegistration(title: titleForAlertController, error: "Email adress must reproduce @")
            return
        }
        
        guard
            user.userName != ""
        else {
            self.presenter?.showErrorRegistration(title: titleForAlertController, error: "Login can`t be empty!")
            return
        }
        
        guard
            user.password != "",
            secondPassword != ""
        else {
            self.presenter?.showErrorRegistration(title: titleForAlertController, error: "Password or Second password can`t be empty!")
            return
        }
        
        guard
            user.password == secondPassword
        else {
            self.presenter?.showErrorRegistration(title: titleForAlertController, error: "Password and Second Password don`t match")
            return
        }
        
        guard
            user.creditCard != ""
        else {
            self.presenter?.showErrorRegistration(title: titleForAlertController, error: "Credit card can`t be empty!")
            return
        }
        
        guard
            user.creditCard.count == 19
        else {
            self.presenter?.showErrorRegistration(title: titleForAlertController, error: "Number credit card shouldn`t have 16 digits")
            return
        }
        presenter?.startActivityIndicator()
        networkService.registration(idUser: 123, userName: user.userName, password: user.password, email: user.email, gender: user.gender, creditCard: user.creditCard, bio: user.bio) { response in
            switch response.result {
            case .success(let result):
                self.presenter?.stopActivityIndicator()
                if result.result == 1 {
                    self.presenter?.registrationSuccess(title: "Congratulation", message: "Registration Success :)")
                } else {
                    self.presenter?.showErrorRegistration(title: titleForAlertController, error: result.userMessage)
                }
            case .failure(let error):
                self.presenter?.stopActivityIndicator()
                self.presenter?.showErrorRegistration(title: titleForAlertController, error: "\(error)")
            }
        }
    }
    
    private func setupTextCount(text: String) {
        switch text.count {
        case 1...4 :
            textCount = 4
        case 5...9 :
            textCount = 9
        case 10...14:
            textCount = 14
        case 15...18:
            textCount = 19
        default:
            textCount = 4
        }
    }
}
