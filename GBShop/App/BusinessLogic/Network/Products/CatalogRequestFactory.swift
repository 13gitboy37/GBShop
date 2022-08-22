//
//  CatalogRequestFactory.swift
//  GBShop
//
//  Created by Никита Мошенцев on 22.08.2022.
//

import Foundation
import Alamofire

protocol CatalogRequestFactory {
    func fetchProductsCatalog(pageNumber: Int, idCategory: Int, completionHandler: @escaping(AFDataResponse<[CatalogResult]>) -> Void)
 }
