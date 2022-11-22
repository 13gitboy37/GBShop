//
//  UserSession.swift
//  GBShop
//
//  Created by Никита Мошенцев on 14.11.2022.
//

import Foundation

class UserSession {
    static let instance = UserSession()
    
    var user = User(id: -1,
                    userName: "",
                    password: "",
                    email: "",
                    gender: "",
                    creditCard: "",
                    bio: "")
}
