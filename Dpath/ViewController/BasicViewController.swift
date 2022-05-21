//
//  BasicViewController.swift
//  Dpath
//
//  Created by sangheon on 2022/05/22.
//

import Foundation
import UIKit

class BasicViewController:UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        self.view.backgroundColor = .white
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000.0, vertical: 0.0), for: .default)
        setBarButtonItems()
    }
    
    func setBarButtonItems() {
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: ImageName.back)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: ImageName.back)
        self.navigationItem.leftItemsSupplementBackButton = true // backbutton 안숨기기
        self.navigationItem.backButtonTitle = ""
    }
    
}
