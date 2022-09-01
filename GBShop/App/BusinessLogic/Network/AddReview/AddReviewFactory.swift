//
//  AddReviewFactory.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.09.2022.
//

import Foundation
import Alamofire

protocol AddReviewFactory {
    func getReviews(idUser: Int, text: String, completionHandler: @escaping(AFDataResponse<AddReviewResult>) -> Void)
 }
