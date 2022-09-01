//
//  DeleteReviewFactory.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.09.2022.
//

import Foundation
import Alamofire

protocol DeleteReviewFactory {
    func deleteReview(idComment: Int, completionHandler: @escaping(AFDataResponse<DeleteReviewResult>) -> Void)
 }
