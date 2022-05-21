//
//  CoverView.swift
//  Dpath
//
//  Created by sangheon on 2022/05/21.
//

import UIKit
import SnapKit
import Then

class CoverView: UIView {
    let backGroundView = UIView().then {
        $0.addBlurToView()
    }
    
    let labelCoverView = UIView().then {
        $0.backgroundColor = .whiteRedColor
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 6
    }
    
    let titleLabel = UILabel().then {
        $0.text = "축제축제"
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 11, weight: .light)
    }
    
    let schoolNameLabel = UILabel().then {
        $0.text = "성신여대"
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 13, weight: .light)
    }
    
    let schoolFestivalLabel = UILabel().then {
        $0.text = "성신여대 2022 대동제"
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    let dateLabel = UILabel().then {
        $0.text = "2020-00-00"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .light)
    }
    
    let updateDateLabel = UILabel().then {
        $0.text = "2020-00-00"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.isHidden = true
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
    
    private func configureUI() {
        addSubview(backGroundView)
        backGroundView.addSubview(labelCoverView)
        labelCoverView.addSubview(titleLabel)
        backGroundView.addSubview(schoolNameLabel)
        backGroundView.addSubview(schoolFestivalLabel)
        backGroundView.addSubview(dateLabel)
        backGroundView.addSubview(updateDateLabel)
        
        backGroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            titleLabel.sizeToFit()
        }
        
        labelCoverView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(18)
            make.height.equalTo(titleLabel.intrinsicContentSize.height + 8)
            make.width.equalTo(titleLabel.intrinsicContentSize.width + 16)
        }
        
        schoolNameLabel.snp.makeConstraints { make in
            make.top.equalTo(labelCoverView.snp.bottom).offset(6)
            make.leading.equalToSuperview().inset(18)
            schoolNameLabel.sizeToFit()
        }
        
        schoolFestivalLabel.snp.makeConstraints { make in
            make.top.equalTo(schoolNameLabel.snp.bottom).offset(6)
            make.leading.equalToSuperview().inset(18)
            schoolFestivalLabel.sizeToFit()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalTo(titleLabel)
            dateLabel.sizeToFit()
        }
        
        updateDateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.leading.equalTo(titleLabel.snp.trailing).offset(14)
            updateDateLabel.sizeToFit()
        }
        
    }
    
}
