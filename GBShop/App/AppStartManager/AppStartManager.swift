//
//  AppStartManager.swift
//  GBShop
//
//  Created by Никита Мошенцев on 01.11.2022.
//

import UIKit

final class AppStartManager {
    
    var window: UIWindow?
    
    let requestFactory = RequestFactory()
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let rootVC = AuthAssembler.build(requestFactory: requestFactory)
        rootVC.navigationItem.title = "Login"
        
        let navVC = self.configuredNavigationController
        navVC.viewControllers = [rootVC]
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
    
    private lazy var configuredNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.navigationBar.isHidden = true
        return navVC
    }()
}
