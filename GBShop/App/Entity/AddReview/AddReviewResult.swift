//
//  AddReview.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.09.2022.
//

import Foundation

struct AddReviewResult: Codable {
    let result: Int
    let userMessage: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
    }
}
