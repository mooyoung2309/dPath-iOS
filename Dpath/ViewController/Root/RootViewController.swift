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
//        let chat = ChatViewController(posting)
        let profile = ProfileViewController()
        
        let nav1 = UINavigationController(rootViewController: home)
        let nav2 = UINavigationController(rootViewController: calendar)
        let nav3 = UINavigationController(rootViewController: Community)
        //let nav4 = UINavigationController(rootViewController: chat)
       // let nav5 = UINavigationController(rootViewController: profile)

        nav1.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: ImageName.home), selectedImage: UIImage(named: ImageName.home))
        nav2.tabBarItem = UITabBarItem(title: "일정", image: UIImage(named: ImageName.date), selectedImage: UIImage(named: ImageName.date ))
        nav3.tabBarItem = UITabBarItem(title: "커뮤니티", image: UIImage(named: ImageName.people), selectedImage: UIImage(named: ImageName.people ))
        //nav4.tabBarItem = UITabBarItem(title: "채팅", image: UIImage(named: ImageName.question), selectedImage: UIImage(named: ImageName.question ))
       // nav5.tabBarItem = UITabBarItem(title: "프로필", image: UIImage(named: ImageName.person), selectedImage: UIImage(named: ImageName.person ))
        self.tabBar.selectedImageTintColor = .whiteRedColor
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.whiteRedColor], for: .selected)

        // UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = .clear

        let navs = [nav1, nav2, nav3]
        setViewControllers(navs, animated: true)
        // tabBar.isTranslucent = false
        self.tabBar.backgroundColor = .white
    }
}
