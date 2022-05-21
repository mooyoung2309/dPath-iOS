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
    
    let cardView = CardView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = .gray
        configureUI()
    }
    
    private func configureUI() {
        contentView.addSubview(cardView)
        cardView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
//    func configure(with model:) {
//
//    }
}
