//
//  TabBarModuleBuilder.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.11.2022.
//

import UIKit

class TabBarAssembler {
    
    static func build() -> (UITabBarController) {
        
        let requestFactory = RequestFactory()
        
        let menuViewController = MenuViewAssembler.build(requestFactory: requestFactory)
        menuViewController.tabBarItem = UITabBarItem(title: "Shop", image: UIImage(systemName: "cart"), selectedImage: UIImage(systemName: "cart.fill"))
        
        let userInfoViewController = UserInfoBuilder.build(requestFactory: requestFactory)
        userInfoViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        let tabBarContoller = TabBarController(controllers: [menuViewController, userInfoViewController])
        return tabBarContoller
    }
}
