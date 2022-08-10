//
//  LogoutRequestFactory.swift
//  GBShop
//
//  Created by Никита Мошенцев on 10.08.2022.
//

import Foundation
import Alamofire

protocol LogoutRequestFactory {
    func logout(idUser: Int, completionHandler: @escaping(AFDataResponse<LogoutResult>) -> Void)
}
