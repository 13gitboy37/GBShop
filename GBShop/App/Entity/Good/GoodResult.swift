//
//  Good.swift
//  GBShop
//
//  Created by Никита Мошенцев on 22.08.2022.
//

import Foundation

struct GoodResult: Codable {
    let result: Int
    let productName: String
    let productPrice: Int
    let productDescription: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case productName = "product_name"
        case productPrice = "product_price"
        case productDescription = "product_description"
    }
}
