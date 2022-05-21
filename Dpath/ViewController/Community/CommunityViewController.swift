//
//  CommunityViewController.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/21.
//

import UIKit
import Then

class CommunityViewController: BasicViewController {
    
    var postTableView = UITableView().then {
        $0.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        $0.rowHeight = 100
        $0.separatorStyle = .singleLine
        $0.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    var postTableViewAdaptor: PostTableViewAdaptor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setViewAdaptor()
        updatePostTableView(posts: ["테스트 1", "테스트 2", "테스트 3", "테스트 4", "테스트 5", "테스트 6", "테스트 7"])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func updatePostTableView(posts: [String]) {
        postTableViewAdaptor.update(posts: posts)
        
        postTableView.reloadData()
    }
}

extension CommunityViewController {
    func setViewAdaptor() {
        postTableViewAdaptor = PostTableViewAdaptor(self)
        postTableView.delegate = postTableViewAdaptor
        postTableView.dataSource = postTableViewAdaptor
        postTableView.reloadData()
    }
    
    func setView() {
        view.addSubview(postTableView)
        
        postTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            postTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            postTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
