//
//  LoginResult.swift
//  GBShop
//
//  Created by Никита Мошенцев on 09.08.2022.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User?
}
