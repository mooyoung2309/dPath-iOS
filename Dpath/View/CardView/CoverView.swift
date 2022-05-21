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
    
    let labelCoverView = UIView().then {
        $0.backgroundColor = .gray
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 2
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
        addSubview(labelCoverView)
        labelCoverView.addSubview(titleLabel)
        addSubview(schoolNameLabel)
        addSubview(schoolFestivalLabel)
        
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
    }
}
