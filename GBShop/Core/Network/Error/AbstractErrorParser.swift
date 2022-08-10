//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Никита Мошенцев on 09.08.2022.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
