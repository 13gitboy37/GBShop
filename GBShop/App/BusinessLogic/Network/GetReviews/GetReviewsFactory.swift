//
//  GetReviewsFactory.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.09.2022.
//

import Foundation
import Alamofire

protocol GetReviewsFactory {
    func getReviews(idProduct: Int, idUser: Int, completionHandler: @escaping(AFDataResponse<GetReviewsResult>) -> Void)
 }
