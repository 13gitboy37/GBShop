//
//  PayBasketFactory.swift
//  GBShop
//
//  Created by Никита Мошенцев on 09.09.2022.
//

import Foundation
import Alamofire

protocol PayBasketFactory {
    func payBasket(idUser: Int, completionHandler: @escaping(AFDataResponse<PayBasketResult>) -> Void)
 }
