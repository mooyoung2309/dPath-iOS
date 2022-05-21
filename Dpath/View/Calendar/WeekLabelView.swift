//
//  WeekLabelView.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/21.
//

import UIKit

class WeekLabelView: UIView {
    var weekStackView = UIStackView()
        .then {
            $0.distribution = .fillEqually
            for week in ["일", "월", "화", "수", "목", "금", "토"] {
                let label = UILabel()
                label.text = week
                label.font = .systemFont(ofSize: 12, weight: .semibold)
                if week == "일" {
                    label.textColor = .systemRed
                } else if week == "토" {
                    label.textColor = .systemBlue
                }
                label.textAlignment = .center
                $0.addArrangedSubview(label)
            }
        }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    func setup() {
        self.addSubview(self.weekStackView)
        self.weekStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.weekStackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.weekStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.weekStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.weekStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
