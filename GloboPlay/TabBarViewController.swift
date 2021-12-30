//
//  TabBarViewController.swift
//  GloboPlay
//
//  Created by Zanette Ciriaco on 28/12/21.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    //private var self: UITabBarController!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupTabBar()
    }
    
    func setupTabBar(){
        let vc1 = UINavigationController(rootViewController: ViewController())
        let vc2 = UINavigationController(rootViewController: MyListViewController())
        
        vc1.title = "Inicio"
        vc2.title = "Minha lista"
        
        let ItemAppearance = UITabBarItem.appearance()
        let titleBarAttibutes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)]
        ItemAppearance.setTitleTextAttributes(titleBarAttibutes, for: .normal)
     
        self.viewControllers = ([vc1, vc2])
        self.tabBar.tintColor = .white
        self.tabBar.barTintColor = .black
        
        guard let items = self.tabBar.items else { return }
        
        items.first?.image = UIImage(systemName: "house.fill")
        items.last?.image = UIImage(systemName: "star.fill")
        
        
    }

}
