//
//  CalendarCollectionViewCell.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/21.
//

import UIKit
import Then

class CalendarCollectionViewCell: UICollectionViewCell {
    static let identifier = "CalendarCollectionViewCell"
    
    var circleStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 2
        //        $0.distribution = .equalCentering
        //        $0.alignment = .center
    }
    var dateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textAlignment = .center
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    let tagView1 = UIView().then {
        $0.backgroundColor = UIColor.pink
    }
    let tagView2 = UIView().then {
        $0.backgroundColor = UIColor.pink
    }
    var tagLabel1 = UILabel().then {
        $0.text = "성신여대 대동제"
        $0.font = .systemFont(ofSize: 9, weight: .regular)
        $0.textColor = UIColor.white
    }
    var tagLabel2 = UILabel().then {
        $0.text = "세종대 봄축제"
        $0.font = .systemFont(ofSize: 9, weight: .regular)
        $0.textColor = UIColor.white
    }
    var calendarItem: [String] = ["11", "22", "232"]
    var date: Date!
    let dateFormatter = DateFormatter()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setView()
    }
    
    override func prepareForReuse() {
        circleStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        tagView1.removeFromSuperview()
        tagView2.removeFromSuperview()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let tmp1 = ["19", "20", "21"]
        
        if tmp1.contains(where: { $0 == self.date.dayString }) {
            if tmp1.first == date.dayString {
                tagView1.roundCorners([.topLeft, .bottomLeft], radius: 3)
                tagView2.roundCorners([.topLeft, .bottomLeft], radius: 3)
            } else if tmp1.last == date.dayString {
                tagView1.roundCorners([.topRight, .bottomRight], radius: 3)
                tagView2.roundCorners([.topRight, .bottomRight], radius: 3)
            }
        }
    }
    
    func update(date: Date) {
        self.date = date
        dateLabel.text = date.dayString
        let tmp = ["5", "8", "16"]
        let tmp1 = ["19", "20", "21"]
        let tmp2 = ["20", "21"]
        
        
        if tmp.contains(where: {$0 == date.dayString})  {
            let circleTagView1 = CircleTagView(color: UIColor.mint)
            let circleTagView2 = CircleTagView(color: UIColor.pink)
            circleStackView.addArrangedSubview(circleTagView1)
            circleStackView.addArrangedSubview(circleTagView2)
        }
        
        if tmp1.contains(where: { $0 == date.dayString }) {
            addSubview(tagView1)
            
            tagView1.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                tagView1.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
                tagView1.leadingAnchor.constraint(equalTo: leadingAnchor),
                tagView1.trailingAnchor.constraint(equalTo: trailingAnchor),
                tagView1.heightAnchor.constraint(equalToConstant: 14),
            ])
            
            if tmp1.first == date.dayString {
                addSubview(tagLabel1)
                
                tagLabel1.translatesAutoresizingMaskIntoConstraints = false
                
                NSLayoutConstraint.activate([
                    tagLabel1.leadingAnchor.constraint(equalTo: tagView1.leadingAnchor, constant: 4),
                    tagLabel1.centerYAnchor.constraint(equalTo: tagView1.centerYAnchor),
                ])
            }
        }
        if tmp2.contains(where: { $0 == date.dayString }) {
            
            addSubview(tagView2)
            
            tagView2.backgroundColor = UIColor.mint
            tagView2.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                tagView2.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 14),
                tagView2.leadingAnchor.constraint(equalTo: leadingAnchor),
                tagView2.trailingAnchor.constraint(equalTo: trailingAnchor),
                tagView2.heightAnchor.constraint(equalToConstant: 14),
            ])
            if tmp2.first == date.dayString {
                addSubview(tagLabel2)
                
                tagLabel2.translatesAutoresizingMaskIntoConstraints = false
                
                NSLayoutConstraint.activate([
                    tagLabel2.leadingAnchor.constraint(equalTo: tagView2.leadingAnchor, constant: 4),
                    tagLabel2.centerYAnchor.constraint(equalTo: tagView2.centerYAnchor),
                ])
            }
        }
    }
}

extension CalendarCollectionViewCell {
    func setView() {
        backgroundColor = .white
        
        addSubview(dateLabel)
        addSubview(circleStackView)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        circleStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: topAnchor),
            dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateLabel.widthAnchor.constraint(equalToConstant: 20),
            dateLabel.heightAnchor.constraint(equalToConstant: 20),
            
            circleStackView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            //            circleStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            //            circleStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            circleStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            //            circleStackView.widthAnchor.constraint(equalToConstant: 30),
            //            circleStackView.heightAnchor.constraint(equalToConstant: 10),
        ])
    }
}
