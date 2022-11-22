//
//  Category.swift
//  GBShop
//
//  Created by Никита Мошенцев on 21.11.2022.
//

import Foundation

class Category {
    init(id: Int, name: String, selected: Bool = false) {
        self.id = id
        self.name = name
        self.selected = selected
    }
    
    let id: Int
    let name: String
    var selected = false
}
