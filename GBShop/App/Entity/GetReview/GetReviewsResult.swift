//
//  GetReviewsResult.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.09.2022.
//

import Foundation

struct GetReviewsResult: Codable {
    let result: Int
    let reviews: [Review]
    
    enum CodingKeys: String, CodingKey {
        case result
        case reviews
    }
}
