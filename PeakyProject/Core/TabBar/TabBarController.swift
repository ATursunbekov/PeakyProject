//
//  ViewController.swift
//  PeakyProject
//
//  Created by Alikhan Tursunbekov on 30/4/24.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        tabBar.tintColor = .black
        tabBar.layer.borderColor = UIColor.gray.cgColor
        tabBar.layer.borderWidth = 0.4
        tabBar.backgroundColor = UIColor(hex: "#F2F2F2", alpha: 0.9)
    }
    
    private func setupTabs() {
        
        let main = createNav(title: "Main", defaultImage: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"), vc: MainViewController(viewModel: MainViewModel()))
        let favorite = createNav(title: "Favorite", defaultImage: UIImage(systemName: "bookmark"), selectedImage: UIImage(systemName: "bookmark.fill"), vc: FavoriteViewController(viewModel: FavoriteViewModel()))
        
        self.setViewControllers([main, favorite], animated: true)
    }
    
    private func createNav(title: String, defaultImage: UIImage?,selectedImage: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.image = defaultImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.title = nil;
        return nav
    }
}
