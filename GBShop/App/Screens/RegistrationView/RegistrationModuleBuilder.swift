//
//  RegistrationModuleBuilder.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.11.2022.
//

import UIKit

final class RegistrationBuilder {
    static func build(requestFactory: RequestFactory) -> UIViewController {
        let requestFactory = requestFactory
        let authNetwork = requestFactory.makeRegistrationRequestFactory()
        let interactor = RegistrationInteractor(networkService: authNetwork)
        let router = RegistrationRouter()
        let presenter = RegistrationPresenter(interactor: interactor,
                                              router: router)
        let viewController = RegistrationViewController()
        viewController.presenter = presenter
        presenter.registrationView = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
