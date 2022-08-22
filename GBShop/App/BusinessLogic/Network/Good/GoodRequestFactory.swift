//
//  GoodRequestFactory.swift
//  GBShop
//
//  Created by Никита Мошенцев on 22.08.2022.
//

import Foundation
import Alamofire

protocol GoodRequestFactory {
    func fetchProductsCatalog(idProduct: Int, completionHandler: @escaping(AFDataResponse<GoodResult>) -> Void)
 }
