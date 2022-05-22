//
//  CommunityTableViewAdaptor.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/21.
//

import UIKit

class PostTableViewAdaptor: NSObject, UITableViewDelegate, UITableViewDataSource {
    weak var superVC: UIViewController!
    var postings: [Posting] = []
    
    init(_ superVC: UIViewController) {
        super.init()
        self.superVC = superVC
    }
    
    func update(postings: [Posting]) {
        self.postings = postings
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return postings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.update(posting: postings[indexPath.section])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Log(indexPath)
        if let communityVC = superVC as? CommunityViewController {
           let communityDetailVC = CommunityDetailViewController(postId: 1)
           communityVC.navigationController?.pushViewController(communityDetailVC, animated: true)
        }
    }
}
