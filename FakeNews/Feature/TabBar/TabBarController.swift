//
//  TabBarController.swift
//  FakeNews
//
//  Created by Henrique Marques on 29/10/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        self.initTabBar()
    }
    
    func initTabBar() {
        tabBar.tintColor = UIColor(red: 14/255, green: 43/255, blue: 88/255, alpha: 1.0)
        tabBar.isTranslucent = true
//        tabBar.layer.masksToBounds = false
//        tabBar.layer.cornerRadius = 20
        tabBar.backgroundColor = .white
        tabBar.unselectedItemTintColor = .systemGray
//        let home = UINavigationController(rootViewController: HomeController())
        
        let guidelines = UINavigationController(rootViewController: OrientationController())
        let report = UINavigationController(rootViewController: DenunciarController())

        self.setViewControllers([report, guidelines], animated: true)
        
        guard let items = tabBar.items else {return}
//        items[0].image = UIImage(systemName: "house")
//        items[0].title = "Home"

        items[0].image = UIImage(systemName: "doc.text.magnifyingglass")
        items[0].title = "Orientações"
        
        items[1].image = UIImage(systemName: "exclamationmark.bubble")
        items[1].title = "Denunciar"
    }

}
