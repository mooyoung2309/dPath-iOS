//
//  CardDetailView.swift
//  Dpath
//
//  Created by sangheon on 2022/05/21.
//

import UIKit
import Then

class CardDetailView: BasicView {
    
    let cardView = CardView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .gray
        configureUI()
    }
    
    override func configureUI() {
        addSubview(cardView)
        cardView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
