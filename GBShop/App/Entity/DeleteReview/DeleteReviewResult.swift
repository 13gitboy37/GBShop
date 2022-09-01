//
//  DeleteReviewResult.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.09.2022.
//

import Foundation

struct DeleteReviewResult: Codable {
    let result: Int
    let userMessage: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
    }
}
