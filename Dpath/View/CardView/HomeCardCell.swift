//
//  HomeCardCell.swift
//  Dpath
//
//  Created by sangheon on 2022/05/21.
//

import UIKit
import FSPagerView
import SnapKit
import Then

class HomeCardCell:FSPagerViewCell {
    static let Identifiler = "HomeCardCell"
    
    let cardImageView = UIImageView(image: UIImage(named: "crop"))
    
    let labelCoverView = UIView().then {
        $0.backgroundColor = .red
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 12
    }
    
    let dayCountLabel = UILabel().then {
        $0.text = "D-14"
        $0.font = .systemFont(ofSize: 12, weight: .bold)
        $0.textAlignment = .center
        $0.backgroundColor = .red
    }
    
    private let coverView = CoverView().then {
        $0.backgroundColor = .yellow
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = .gray
        configureUI()
    }
    
    private func configureUI() {
        contentView.addSubview(coverView)
        contentView.addSubview(cardImageView)
        contentView.addSubview(labelCoverView)
        labelCoverView.addSubview(dayCountLabel)
        
        coverView.snp.makeConstraints { make in
            make.trailing.leading.bottom.equalToSuperview()
            make.height.equalTo(contentView.height * 0.17)
        }
        
        cardImageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(coverView.snp.top)
        }
        
        dayCountLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            dayCountLabel.sizeToFit()
        }
        
        labelCoverView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(16)
            make.height.equalTo(dayCountLabel.intrinsicContentSize.height + 12)
            make.width.equalTo(dayCountLabel.intrinsicContentSize.height + 36)
        }
        
    }
    
//    func configure(with model:) {
//
//    }
}
