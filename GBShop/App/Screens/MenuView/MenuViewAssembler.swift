//
//  MenuViewBuilder.swift
//  GBShop
//
//  Created by Никита Мошенцев on 22.11.2022.
//

import UIKit


final class MenuViewAssembler {
    static func build(requestFactory: RequestFactory) -> UIViewController {
        let requestFactory = requestFactory
        let catalogNetwork = requestFactory.makeCatalogRequestFactory()
        let interactor = MenuViewInteractor(networkService: catalogNetwork)
        let router = MenuViewRouter()
        let presenter = MenuViewPresenter(interactor: interactor,
                                          router: router)
        let tableAdapter = MenuTableAdapter()
        let viewController = MenuViewController(presenter: presenter, tableAdapter: tableAdapter)
        presenter.menuView = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
