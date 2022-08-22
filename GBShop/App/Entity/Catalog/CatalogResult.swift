//
//  Catalog.swift
//  GBShop
//
//  Created by Никита Мошенцев on 22.08.2022.
//

import Foundation

struct CatalogResult: Codable {
     let idProduct: Int
     let productName: String
     let price: Int

     enum CodingKeys: String, CodingKey {
         case idProduct = "id_product"
         case productName = "product_name"
         case price
     }
 }
