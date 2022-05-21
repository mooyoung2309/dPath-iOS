//
//  FestivalTableViewCell.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/21.
//

import UIKit
import Then

class FestivalTableViewCell: UITableViewCell {
    static let identifier = "FestivalTableViewCell"
    
    var festival: String!
    
    var tagView = UIView().then {
        $0.backgroundColor = UIColor.mint
    }
    var titleLabel = UILabel().then {
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    var dateLabel = UILabel().then {
        $0.text = "2022.05.21"
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 11)
    }
    var nextLabel = UILabel().then {
        $0.text = "보러가기"
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
    }
    
    func update(festival: String) {
        self.festival = festival
        titleLabel.text = festival
    }
}

extension FestivalTableViewCell {
    func setView() {
        addSubview(tagView)
        addSubview(titleLabel)
        addSubview(dateLabel)
        addSubview(nextLabel)
        
        tagView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        nextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tagView.topAnchor.constraint(equalTo: topAnchor),
            tagView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            tagView.widthAnchor.constraint(equalToConstant: 30),
            tagView.heightAnchor.constraint(equalToConstant: 16),
            
            titleLabel.topAnchor.constraint(equalTo: tagView.bottomAnchor, constant: 6),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            nextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            nextLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
