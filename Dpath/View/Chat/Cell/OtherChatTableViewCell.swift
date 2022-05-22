//
//  OtherChatTableViewCell.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/22.
//

import UIKit
import Then

class OtherChatTableViewCell: UITableViewCell {
    static let identifier = "OtherChatTableViewCell"
    
    var circleView = UIView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 16
        $0.backgroundColor = UIColor(hex: 0xEAEAEA)
    }
    var nameLabel = UILabel().then {
        $0.text = "닉네임"
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 12)
    }
    var commentView = UIView().then {
        $0.backgroundColor = UIColor(hex: 0xEAEAEA)

    }
    var commentLabel = UILabel().then {
        $0.textColor = UIColor.black
        $0.text = "반갑습니다. 5월 21일 성신여대 대동제에 함께 갈 2명을 모집중 입니다."
        $0.numberOfLines = 10
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.setLineSpacing(lineSpacing: 7, lineHeightMultiple: 1)
        $0.sizeToFit()
    }
    
    func update(chat: String) {
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commentView.roundCorners([.topRight, .bottomLeft, .bottomRight], radius: 20)
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }
}

extension OtherChatTableViewCell {
    func setView() {
        backgroundColor = UIColor(hex: 0xFAFAFA)
        addSubview(circleView)
        addSubview(nameLabel)
        addSubview(commentView)
        addSubview(commentLabel)
        
        circleView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        commentView.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            circleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            circleView.widthAnchor.constraint(equalToConstant: 32),
            circleView.heightAnchor.constraint(equalToConstant: 32),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 8),
            
            commentLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            commentLabel.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 21),
            commentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -29),
            
            commentView.topAnchor.constraint(equalTo: commentLabel.topAnchor, constant: -11),
            commentView.leadingAnchor.constraint(equalTo: commentLabel.leadingAnchor, constant: -13),
            commentView.trailingAnchor.constraint(equalTo: commentLabel.trailingAnchor, constant: 13),
            commentView.bottomAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 11),
        ])
    }
}
