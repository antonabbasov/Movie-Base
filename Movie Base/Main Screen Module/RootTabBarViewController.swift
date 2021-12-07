//
//  HomeViewController.swift
//  Movie Base
//
//  Created by Anton on 24.11.2021.
//

import UIKit

final class RootTabBarViewController: UITabBarController {

    override func viewDidLoad () {
        super.viewDidLoad ()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        setupVCs()
    }
    
    func setupVCs () {
        viewControllers =   [
            createNavController (for: SearchViewController(), title: NSLocalizedString ("Search", comment: ""), image: UIImage (systemName : "magnifyingglass")!),
            createNavController (for: HomeViewController(), title: NSLocalizedString ("Home", comment: ""), image: UIImage (systemName : "house")!),
            createNavController (for: ProfileViewController(), title: NSLocalizedString ("Profile" , comment: ""),
                                 image: UIImage ( systemName : "person")!)
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage)  -> UIViewController {
        
        let navController = UINavigationController (rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        //rootViewController.navigationItem.title = title
        return navController
    }
}

