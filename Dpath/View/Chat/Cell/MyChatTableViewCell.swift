//
//  MyChatTableViewCell.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/22.
//

import UIKit

class MyChatTableViewCell: UITableViewCell {
    static let identifier = "MyChatTableViewCell"

    var commentView = UIView().then {
        $0.backgroundColor = UIColor(hex: 0xFFA285)
    }
    var commentLabel = UILabel().then {
        $0.textColor = UIColor.white
        $0.text = "넵 안녕하세요 ㅎㅎ"
        $0.textAlignment = .right
        $0.numberOfLines = 10
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.setLineSpacing(lineSpacing: 5, lineHeightMultiple: 1)
        $0.sizeToFit()
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
        commentView.roundCorners([.topLeft, .bottomLeft, .bottomRight], radius: 20)
    }
    
    func update(chat: String) {
        
    }
}

extension MyChatTableViewCell {
    
    func setView() {
        addSubview(commentView)
        addSubview(commentLabel)
        
        commentView.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            commentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
//            commentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
            commentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -29),
            
            commentView.topAnchor.constraint(equalTo: commentLabel.topAnchor, constant: -11),
            commentView.leadingAnchor.constraint(equalTo: commentLabel.leadingAnchor, constant: -13),
            commentView.trailingAnchor.constraint(equalTo: commentLabel.trailingAnchor, constant: 13),
            commentView.bottomAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 11),
        ])
    }
}
