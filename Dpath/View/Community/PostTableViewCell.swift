//
//  CommunityTableViewCell.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/21.
//

import UIKit
import Then

class PostTableViewCell: UITableViewCell {
    static let identifier = "PostTableViewCell"
    
    var imgView = UIView().then {
        $0.backgroundColor = UIColor.mint
        $0.layer.cornerRadius = 20
    }
    var tagLabel = UILabel().then {
        $0.text = "축제"
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 12)
    }
    var titleLabel = UILabel().then {
        $0.text = "제목을 여기에 입력해주세요."
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    var peopleImageView = UIImageView(image: UIImage(named: "people"))
    var peopleLabel = UILabel().then {
        $0.text = "3명"
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 12)
    }
    var locationImageView = UIImageView(image: UIImage(named: "location_on"))
    var locationLabel = UILabel().then {
        $0.text = "성신여대"
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 10)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
    }
    
    func update(posting: Posting) {
        titleLabel.text = posting.postingName
        tagLabel.text = "축제"
        peopleLabel.text = "\(String(posting.personNum))명"
        locationLabel.text = "성신여대"
    }
}

extension PostTableViewCell {
    func setView() {
        addSubview(imgView)
        addSubview(tagLabel)
        addSubview(titleLabel)
        addSubview(peopleImageView)
        addSubview(peopleLabel)
        addSubview(locationImageView)
        addSubview(locationLabel)
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        peopleImageView.translatesAutoresizingMaskIntoConstraints = false
        peopleLabel.translatesAutoresizingMaskIntoConstraints = false
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imgView.widthAnchor.constraint(equalToConstant: 88),
            imgView.heightAnchor.constraint(equalToConstant: 88),
            
            tagLabel.topAnchor.constraint(equalTo: imgView.topAnchor),
            tagLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 8),
            
            titleLabel.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: 6),
            titleLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 8),
            
            peopleImageView.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 8),
            peopleImageView.bottomAnchor.constraint(equalTo: imgView.bottomAnchor),
            peopleImageView.widthAnchor.constraint(equalToConstant: 18),
            peopleImageView.heightAnchor.constraint(equalToConstant: 18),
            
            peopleLabel.leadingAnchor.constraint(equalTo: peopleImageView.trailingAnchor, constant: 6),
            peopleLabel.bottomAnchor.constraint(equalTo: imgView.bottomAnchor),
            
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            locationLabel.bottomAnchor.constraint(equalTo: imgView.bottomAnchor),
            
            locationImageView.trailingAnchor.constraint(equalTo: locationLabel.leadingAnchor, constant: 2),
            locationImageView.bottomAnchor.constraint(equalTo: imgView.bottomAnchor),
            locationImageView.widthAnchor.constraint(equalToConstant: 18),
            locationImageView.heightAnchor.constraint(equalToConstant: 18),
        ])
    }
}
