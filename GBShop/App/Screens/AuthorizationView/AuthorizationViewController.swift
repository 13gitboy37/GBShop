//
//  AuthorizationViewController.swift
//  GBShop
//
//  Created by Никита Мошенцев on 31.10.2022.
//

import UIKit

protocol AuthViewInput: AnyObject {
    func showAlertController(with error: String)
}

final class AuthorizationViewController: UIViewController {
    
    //MARK: Properties
    private var authView: AuthorizationView {
        guard let view = self.view as? AuthorizationView else {
            let correctView = AuthorizationView(frame: self.view.frame)
            self.view = correctView
            return correctView
        }
        return view
    }
    
    var presenter: AuthViewOutput?
    
    //MARK: Lifecycle
    override func loadView() {
        super.loadView()
        self.view = AuthorizationView(frame: self.view.frame)
        authView.authViewController = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearData()
        authView.subscribeObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        authView.unsubscribeObserver()
    }
    
    private func clearData() {
        authView.userNameTextField.text = ""
        authView.passwordTextField.text = ""
    }
}

//MARK: Realese AuthViewInput Protocol
extension AuthorizationViewController: AuthViewInput {
    func showAlertController(with error: String) {
        DispatchQueue.main.async {
            self.present(self.authView.presentAlert(error: error),
                         animated: true)
        }
    }
}
