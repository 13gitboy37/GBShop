//
//  AuthorizationModuleBuilder.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.11.2022.
//

import UIKit

final class AuthAssembler {
    static func build(requestFactory: RequestFactory) -> UIViewController {
        let requestFactory = requestFactory
        let authNetwork = requestFactory.makeAuthRequestFactory()
        let interactor = AuthInteractor(networkService: authNetwork)
        let router = AuthRouter()
        let presenter = AuthPresenter(interactor: interactor,
                                              router: router)
        let viewController = AuthorizationViewController()
        viewController.presenter = presenter
        presenter.authorizationView = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
