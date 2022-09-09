//
//  RemoveFromBasketFactory.swift
//  GBShop
//
//  Created by Никита Мошенцев on 09.09.2022.
//

import Foundation
import Alamofire

protocol RemoveFromBasketFactory {
    func removeFromBasket(idProduct: Int, completionHandler: @escaping(AFDataResponse<RemoveFromBasketResult>) -> Void)
 }
