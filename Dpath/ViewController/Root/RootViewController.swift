//
//  RootViewController.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/21.
//

import UIKit

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
//        let tabHome = UINavigationController(rootViewController: HomeCardViewController())
//        let tabHomeBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "calendar"), selectedImage: UIImage(named: "selectedImage.png"))
        
        let tabCalendar = UINavigationController(rootViewController: CalendarViewController())
        let tabCalendarBarItem = UITabBarItem(title: "캘린더", image: UIImage(systemName: "calendar"), selectedImage: UIImage(systemName: "calendar"))
        
        let tabCommunity = UINavigationController(rootViewController: CommunityViewController())
        let tabCommunityBarItem = UITabBarItem(title: "커뮤니티", image: UIImage(systemName: "calendar"), selectedImage: UIImage(systemName: "calendar"))
        
        tabCalendar.tabBarItem = tabCalendarBarItem
        tabCommunity.tabBarItem = tabCommunityBarItem
        
        self.viewControllers = [tabCalendar, tabCommunity]
    }

}
