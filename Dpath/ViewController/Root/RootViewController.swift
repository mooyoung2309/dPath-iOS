//
//  RootViewController.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/21.
//

import RxRelay
import RxSwift
import UIKit

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = 0
        }
    }

    private func setupControllers() {
        let home = HomeCardViewController()
        let calendar = CalendarViewController()
        let Community = CommunityViewController()
        let chat = ChatViewController()
        let profile = ProfileViewController()
        
        let nav1 = UINavigationController(rootViewController: home)
        let nav2 = UINavigationController(rootViewController: calendar)
        let nav3 = UINavigationController(rootViewController: Community)
        let nav4 = UINavigationController(rootViewController: chat)
        let nav5 = UINavigationController(rootViewController: profile)

        nav1.tabBarItem = UITabBarItem(title: "투데이", image: UIImage(named: "home"), selectedImage: UIImage(named: "home2"))
        nav2.tabBarItem = UITabBarItem(title: "MY 레코드", image: UIImage(named: "myrecord"), selectedImage: UIImage(named: "myrecord2" ))
        nav3.tabBarItem = UITabBarItem(title: "전체 레코드", image: UIImage(named: "allrecord"), selectedImage: UIImage(named: "allrecord2" ))
        nav4.tabBarItem = UITabBarItem(title: "MY DJ", image: UIImage(named: "mydj"), selectedImage: UIImage(named: "mydj2" ))
        nav5.tabBarItem = UITabBarItem(title: "MY 페이지", image: UIImage(named: "mypage"), selectedImage: UIImage(named: "mypage2" ))
        self.tabBar.selectedImageTintColor = .blue
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.green], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], for: .selected)

        // UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = .clear

        let navs = [nav1, nav2, nav3, nav4, nav5]
        setViewControllers(navs, animated: true)
        // tabBar.isTranslucent = false
        self.tabBar.backgroundColor = .darkGray
    }
}
