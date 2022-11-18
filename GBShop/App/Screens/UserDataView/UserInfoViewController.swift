//
//  UserDataViewController.swift
//  GBShop
//
//  Created by Никита Мошенцев on 14.11.2022.
//

import UIKit

protocol UserInfoViewControllerInput {
    func showAlertController(with title: String, error: String)
}

final class UserInfoViewController: UIViewController {
    
    private var userInfoView: UserInfoView {
        guard let view = self.view as? UserInfoView else {
            let correctView = UserInfoView(frame: self.view.frame)
            self.view = correctView
            return correctView
        }
        return view
    }
    
    var presenter: UserInfoOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = UserInfoView(frame: self.view.frame)
        userInfoView.userInfoViewController = self
        userInfoView.creditCardTextField.delegate = self
        self.navigationController?.navigationBar.isHidden = false
        userInfoView.showUserInfo(userInfo: UserSession.instance.user)
    }
    
    func presentAlert(title: String, error: String) -> UIAlertController {
        let alertController = UIAlertController(
            title: title,
            message: error,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Close",style: .cancel)
        alertController.addAction(action)
        
        return alertController
    }
}


//MARK: - TextFieldDelegate

extension UserInfoViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard
            let boolForDelegate = presenter?.textFieldDelegate(textField, shouldChangeCharactersIn: range, replacementString: string)
        else {
            return false
        }
        return boolForDelegate
    }
}

extension UserInfoViewController: UserInfoViewControllerInput {
    func showAlertController(with title: String, error: String) {
        DispatchQueue.main.async {
            self.present(self.presentAlert(title: title, error: error),
                         animated: true)
        }
    }
    
    
}
