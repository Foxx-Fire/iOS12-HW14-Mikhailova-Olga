//
//  MainTabBarViewController.swift
//  HW14
//
//  Created by mbpro2.0/16/512 on 03.02.2024.
//

import UIKit

class MainTabBarViewController:  UITabBarController, UITabBarControllerDelegate {
    
    static let identifier = "TabBar"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabBarController()
        setupTabBarViewControllers()
    }
    
    private func setupTabBarController() {
        tabBar.tintColor = .blue
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.layer.borderWidth = 1
    }
    
    func setupTabBarViewControllers() {
        let library = LibraryTabBarViewController()
        let libraryItem = UITabBarItem(title: "Library", image:UIImage(systemName: "photo"), selectedImage: UIImage(systemName:  "photo"))
        library.tabBarItem = libraryItem
        
        let forYou = ForYouTabBarViewController()
        let forYouItem = UITabBarItem(title: "ForYou", image: UIImage(named: "foryou"), selectedImage: UIImage(named:"foryou" ))
        forYou.tabBarItem = forYouItem
        
        let albums = AlbumsTabBarViewController()
        let albumsItem = UITabBarItem(title: "Albums", image:UIImage(named: "albums"), selectedImage: UIImage(named: "albums"))
        albums.tabBarItem = albumsItem
        
        let search = SearchTabBarViewController()
        let searchItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        search.tabBarItem = searchItem
        
        func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            return true
        }
        
        let controllers = [library, forYou, albums, search]
        self.setViewControllers(controllers, animated: true)
    }
}



