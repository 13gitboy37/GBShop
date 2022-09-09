//
//  AddToBasketFactory.swift
//  GBShop
//
//  Created by Никита Мошенцев on 09.09.2022.
//

import Foundation
import Alamofire

protocol AddToBasketFactory {
    func addToBasket(idProduct: Int, quantity: Int, completionHandler: @escaping(AFDataResponse<AddToBasketResult>) -> Void)
 }
