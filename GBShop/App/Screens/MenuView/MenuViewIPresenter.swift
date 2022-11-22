//
//  MenuViewIPresenter.swift
//  GBShop
//
//  Created by Никита Мошенцев on 22.11.2022.
//

import Foundation

protocol MenuViewOutput: AnyObject {
    func loadCatalog()
    func didLoadCatalog(catalog: [GoodInCatalogResult])
}

final class MenuViewPresenter {
    weak var menuView: MenuViewInput?
    var router: MenuViewRouterProtocol
    var interactor: MenuViewInteractorProtocol
    
    init(interactor: MenuViewInteractorProtocol,
         router: MenuViewRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension MenuViewPresenter: MenuViewOutput {
    func loadCatalog() {
        interactor.startLoadCatalog()
    }
    
    func didLoadCatalog(catalog: [GoodInCatalogResult]) {
        menuView?.reloadTable(withProducts: catalog)
    }
}
