//
//  MyChatTableViewApdator.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/22.
//

import UIKit

class MyChatTableViewApdator: NSObject, UITableViewDelegate, UITableViewDataSource {
//    weak var superVC: UIViewController!
    var chats: [String] = []
    
//    init() {
//        super.init()
////        self.superVC = superVC
//    }
    
    func update(chats: [String]) {
        self.chats = chats
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: OtherChatTableViewCell.identifier, for: indexPath) as! OtherChatTableViewCell
            
            cell.update(chat: chats[indexPath.section])
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: MyChatTableViewCell.identifier, for: indexPath) as! MyChatTableViewCell
            cell.update(chat: chats[indexPath.section])
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Log(indexPath)
//        if let communityVC = superVC as? CommunityViewController {
//            let communityDetailVC = CommunityDetailViewController(postId: Int)
//            communityVC.navigationController?.pushViewController(communityDetailVC, animated: true)
//        }
    }
}
