//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Никита Мошенцев on 09.08.2022.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping(AFDataResponse<LoginResult>) -> Void)
}
