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
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 6
    }
    var tagLabel = UILabel().then {
        $0.text = "축제"
        $0.font = .systemFont(ofSize: 9, weight: .medium)
        $0.textColor = UIColor.white
    }
    var titleLabel = UILabel().then {
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    var dateLabel = UILabel().then {
        $0.text = "2022.05.20"
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 11)
    }
    var nextLabel = UILabel().then {
        $0.text = "보러가기"
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 12, weight: .light)
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
        addSubview(tagLabel)
        addSubview(titleLabel)
        addSubview(dateLabel)
        addSubview(nextLabel)
        
        tagView.translatesAutoresizingMaskIntoConstraints = false
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        nextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tagView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            tagView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            tagView.widthAnchor.constraint(equalToConstant: 30),
            tagView.heightAnchor.constraint(equalToConstant: 16),
            
            tagLabel.topAnchor.constraint(equalTo: tagView.topAnchor, constant: 3.5),
            tagLabel.leadingAnchor.constraint(equalTo: tagView.leadingAnchor, constant: 7),
            tagLabel.trailingAnchor.constraint(equalTo: tagView.trailingAnchor, constant: -7),
            tagLabel.bottomAnchor.constraint(equalTo: tagView.bottomAnchor, constant: -3.5),
            
            titleLabel.topAnchor.constraint(equalTo: tagView.bottomAnchor, constant: 6),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            nextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            nextLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
