//
//  UserInfoBuilder.swift
//  GBShop
//
//  Created by Никита Мошенцев on 15.11.2022.
//

import UIKit

final class UserInfoBuilder {
    static func build(requestFactory: RequestFactory) -> UIViewController {
        let requestFactory = requestFactory
        let userInfoNetwork = requestFactory.makeChangeDataUserRequsetFactory()
        let interactor = UserInfoInteractor(networkService: userInfoNetwork)
        let router = UserInfoRouter()
        let presenter = UserInfoPresenter(interactor: interactor,
                                              router: router)
        let viewController = UserInfoViewController()
        viewController.presenter = presenter
        presenter.userInfoViewController = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
