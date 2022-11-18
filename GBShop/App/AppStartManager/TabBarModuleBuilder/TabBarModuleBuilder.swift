//
//  TabBarModuleBuilder.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.11.2022.
//

import UIKit

class TabBarBuilder {
    
    static func build() -> (UITabBarController) {
        
        let requestFactory = RequestFactory()
        
        let userInfoViewController = UserInfoBuilder.build(requestFactory: requestFactory)
        userInfoViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        let tabBarContoller = TabBarController(controllers: [userInfoViewController])
        return tabBarContoller
    }
}
