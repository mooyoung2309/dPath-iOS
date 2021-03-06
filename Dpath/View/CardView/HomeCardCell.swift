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
import Kingfisher

class HomeCardCell:FSPagerViewCell {
    static let Identifiler = "HomeCardCell"
    
    let cardView = CardView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = .gray
        configureUI()
        cardView.dayCountLabel.text = "D-\(Int.random(in: 0..<50))"
    }
    
    private func configureUI() {
        contentView.addSubview(cardView)
        cardView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(with model:FestivalList) {
        cardView.cardImageView.setImage(with: model.imgURL)
        cardView.coverView.dateLabel.text = model.date
        cardView.coverView.titleLabel.text = model.festivalName
        cardView.coverView.schoolNameLabel.text = model.univName
        cardView.coverView.schoolFestivalLabel.text = model.festivalName
        
    }
}
