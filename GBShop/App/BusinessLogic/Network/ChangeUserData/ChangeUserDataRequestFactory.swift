//
//  ChangeUserDataRequestFactory.swift
//  GBShop
//
//  Created by Никита Мошенцев on 10.08.2022.
//

import Foundation
import Alamofire

protocol ChangeUserDataRequestFactory {
    func changeUserData(idUser: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping(AFDataResponse<ChangeUserDataResult>) -> Void)
}
