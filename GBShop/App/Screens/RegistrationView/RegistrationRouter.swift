//
//  RegistrationRouter.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.11.2022.
//

import UIKit

protocol RegistrationRouterProtocol {
    func presentLoginViewController()
}

final class RegistrationRouter {
    weak var viewController: UIViewController?
}

extension RegistrationRouter: RegistrationRouterProtocol {
    func presentLoginViewController() {
        DispatchQueue.main.async {
            self.viewController?.navigationController?.popViewController(animated: true)
        }
    }
}
