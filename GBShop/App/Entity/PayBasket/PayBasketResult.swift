//
//  File.swift
//  GBShop
//
//  Created by Никита Мошенцев on 09.09.2022.
//

import Foundation

struct PayBasketResult: Codable {
    var amount: Int
    var countGoods: Int
    var contents: [GoodInCatalogResult]
    
    enum CodingKeys: String, CodingKey {
        case amount
        case countGoods = "count_goods"
        case contents
    }
}
