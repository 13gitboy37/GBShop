//
//  AddToBasketResult.swift
//  GBShop
//
//  Created by Никита Мошенцев on 09.09.2022.
//

import Foundation

struct AddToBasketResult: Codable {
    let result: Int
    
    enum CodingKeys: String, CodingKey {
        case result
    }
}

