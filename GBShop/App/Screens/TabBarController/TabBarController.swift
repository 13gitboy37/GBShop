//
//  TabBarController.swift
//  GBShop
//
//  Created by Никита Мошенцев on 15.11.2022.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private var controllers: [UIViewController]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(controllers: [UIViewController]) {
        
        self.controllers = controllers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewControllers = controllers
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            return true
        }
}

