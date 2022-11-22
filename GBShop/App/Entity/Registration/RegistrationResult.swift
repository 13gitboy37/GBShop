//
//  Registration.swift
//  GBShop
//
//  Created by Никита Мошенцев on 10.08.2022.
//

import Foundation

struct RegistrationResult: Codable {
    let result: Int
    let userMessage: String
}

extension RegistrationResult {
    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
    }
}
