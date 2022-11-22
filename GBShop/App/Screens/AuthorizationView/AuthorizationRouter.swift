//
//  AuthorizationRouter.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.11.2022.
//

import UIKit

protocol AuthRouterProtocol {
    func presentShopViewController()
    func presentRegistrationViewController()
}

final class AuthRouter {
    weak var viewController: UIViewController?
}

extension AuthRouter: AuthRouterProtocol {
    func presentShopViewController() {
        DispatchQueue.main.async {
            let tabBarController = TabBarBuilder.build()
            self.viewController?.navigationController?.pushViewController(tabBarController, animated: true)
        }
    }
    
    func presentRegistrationViewController() {
        let requestFactory = RequestFactory()
        let regViewController = RegistrationBuilder.build(requestFactory: requestFactory)
        viewController?.navigationController?.navigationBar.isHidden = false
        DispatchQueue.main.async {
            self.viewController?.navigationController?.pushViewController(regViewController, animated: true)
        }
    }
    
}
