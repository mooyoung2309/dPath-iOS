//
//  CommunityDetailViewController.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/21.
//

import UIKit

class CommunityDetailViewController: UIViewController {
    var postId: Int!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(postId: Int) {
        super.init(nibName: nil, bundle: nil)
        self.postId = postId
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.mint
    }
}
