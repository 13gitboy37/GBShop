//
//  User.swift
//  GBShop
//
//  Created by Никита Мошенцев on 09.08.2022.
//

import Foundation

struct User: Codable {
    let id: Int
    let userName: String
    let password: String
    let email: String
    let gender: String
    let creditCard: String
    let bio: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case userName = "username"
        case password
        case email
        case gender
        case creditCard = "credit_card"
        case bio
    }
}
