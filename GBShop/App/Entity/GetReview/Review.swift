//
//  Review.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.09.2022.
//

import Foundation

struct Review: Codable {
    let review: String
    
    enum CodingKeys: String, CodingKey {
        case review
    }
}
