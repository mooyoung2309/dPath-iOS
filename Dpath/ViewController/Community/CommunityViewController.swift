//
//  CommunityViewController.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/21.
//

import UIKit
import Then
import Alamofire

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
//        updatePostTableView(posts: ["테스트 1", "테스트 2", "테스트 3", "테스트 4", "테스트 5", "테스트 6", "테스트 7"])
        tmp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func updatePostTableView(postings: [Posting]) {
        postTableViewAdaptor.update(postings: postings)
        
        postTableView.reloadData()
    }
    
    func tmp() {
        let url = "https://dongmoo.shop/postings"
        // AF.request().responseJSON으로 호출하면 JSON형식의 response를 받는다.
        AF.request(url, method: .get).responseJSON { response in
            print("response: \(response)")
            // response의 데이터를 받을 [Routineee] 타입의 리스트 변수
            var routines: PostResponse
            do {
                let decoder = JSONDecoder()
                switch (response.result) {
                // 성공/실패 구분
                case .success:
                    // response의 data를 [Routineeee]로 변환
                    routines = try decoder.decode(PostResponse.self, from: response.data!)
                    self.updatePostTableView(postings: routines.result)
                    print("routines: \(routines)")
                    
                case .failure(let error):
                    print("errorCode: \(error._code)")
                    print("errorDescription: \(error.errorDescription!)")
                }
            } catch let parsingError {
                print("Error:", parsingError)
            }
        }.resume()
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
