//
//  UserInfoPresenter.swift
//  GBShop
//
//  Created by Никита Мошенцев on 15.11.2022.
//

import UIKit

protocol UserInfoOutput: AnyObject {
    func textFieldDelegate(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    func changeUserInfo(userInfo: User)
    func showAlertController(title: String, error: String)
}

final class UserInfoPresenter {
    
    weak var userInfoViewController: UserInfoViewController?
    var interactor: UserInfoInteractorProtocol
    var router: UserInfoRouterProtocol
    
    init(interactor: UserInfoInteractorProtocol, router: UserInfoRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
}

extension UserInfoPresenter: UserInfoOutput {
    func textFieldDelegate(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        interactor.textFieldDelegate(textField, shouldChangeCharactersIn: range, replacementString: string)
    }
    
    func changeUserInfo(userInfo: User) {
        interactor.changeUserInfo(userInfo: userInfo)
    }
    
    func showAlertController(title: String, error: String) {
        userInfoViewController?.showAlertController(with: title, error: error)
    }
}
