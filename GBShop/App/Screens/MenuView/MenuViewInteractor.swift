//
//  MenuViewInteractor.swift
//  GBShop
//
//  Created by Никита Мошенцев on 22.11.2022.
//

import Foundation

protocol MenuViewInteractorProtocol {
    func startLoadCatalog()
}

final class MenuViewInteractor {
    weak var presenter: MenuViewOutput?
    
    var networkService: CatalogRequestFactory
    
    init(networkService: CatalogRequestFactory) {
        self.networkService = networkService
    }
}

extension MenuViewInteractor: MenuViewInteractorProtocol {
    func startLoadCatalog() {
        networkService.fetchProductsCatalog(pageNumber: 1, idCategory: 1) { response in
            switch response.result {
            case .success(let catalog):
                self.presenter?.didLoadCatalog(catalog: catalog.good)
            case .failure(let error):
                print(error)
            }
        }
    }
}
