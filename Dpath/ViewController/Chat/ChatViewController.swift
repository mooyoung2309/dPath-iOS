//
//  ChatViewController.swift
//  Dpath
//
//  Created by sangheon on 2022/05/21.
//

import UIKit
import Then

class ChatViewController: UIViewController {
    var noticeView = UIView().then {
        $0.backgroundColor = UIColor.white
    }
    var noticeImageView = UIImageView(image: UIImage(named: ImageName.pin)).then {
        $0.tintColor = UIColor.black
    }
    var noticeLabel = UILabel().then {
        $0.text = "반갑습니다. 5월21일 성신여대 대동제에 함께 갈 2명을 모집 중 입니다."
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 14)
        $0.numberOfLines = 2
    }
    var chatTableView = UITableView().then {
        $0.register(OtherChatTableViewCell.self, forCellReuseIdentifier: OtherChatTableViewCell.identifier)
        $0.register(MyChatTableViewCell.self, forCellReuseIdentifier: MyChatTableViewCell.identifier)
        $0.separatorStyle = .none
        $0.rowHeight = 100
    }
    
    var messageView = UIView().then {
        $0.backgroundColor = UIColor.red
    }
    var chatTableViewAdaptor = MyChatTableViewApdator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: 0xFAFAFA)
        setView()
        setViewAdaptor()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        chatTableView.rowHeight = UITableView.automaticDimension
//        chatTableView.estimatedRowHeight = 80
    }
}

extension ChatViewController {
    func setViewAdaptor() {
        chatTableViewAdaptor.update(chats: ["ddd3", "ddd2"])
        chatTableView.delegate = chatTableViewAdaptor
        chatTableView.dataSource = chatTableViewAdaptor
        chatTableView.reloadData()
    }
    
    func setView() {
        view.addSubview(noticeView)
        noticeView.addSubview(noticeImageView)
        noticeView.addSubview(noticeLabel)
        view.addSubview(chatTableView)
        view.addSubview(messageView)
        
        noticeView.translatesAutoresizingMaskIntoConstraints = false
        noticeImageView.translatesAutoresizingMaskIntoConstraints = false
        noticeLabel.translatesAutoresizingMaskIntoConstraints = false
        chatTableView.translatesAutoresizingMaskIntoConstraints = false
        messageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            noticeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            noticeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            noticeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            noticeView.heightAnchor.constraint(equalToConstant: 65),
            
            noticeImageView.centerYAnchor.constraint(equalTo: noticeView.centerYAnchor),
            noticeImageView.leadingAnchor.constraint(equalTo: noticeView.leadingAnchor, constant: 16),
            noticeImageView.heightAnchor.constraint(equalToConstant: 24),
            noticeImageView.widthAnchor.constraint(equalToConstant: 24),
            
            noticeLabel.centerYAnchor.constraint(equalTo: noticeView.centerYAnchor),
            noticeLabel.leadingAnchor.constraint(equalTo: noticeImageView.trailingAnchor, constant: 10),
            noticeLabel.trailingAnchor.constraint(equalTo: noticeView.trailingAnchor, constant: -16),
            
            chatTableView.topAnchor.constraint(equalTo: noticeView.bottomAnchor),
            chatTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            chatTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            chatTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            messageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            messageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            messageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            messageView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
