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
    var calendarItem: [String] = ["11", "22", "232"]
    
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
    }
    
    func update(date: Date) {
        dateLabel.text = date.dayString
        
        for item in calendarItem {
            let circleTagView = CircleTagView(color: UIColor.random())
            circleStackView.addArrangedSubview(circleTagView)
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
