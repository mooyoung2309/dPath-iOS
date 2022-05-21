//
//  HomeCardView.swift
//  Dpath
//
//  Created by sangheon on 2022/05/21.
//

import UIKit
import SnapKit
import FSPagerView

class HomeCardView:BasicView {
    
    let cardTableView:FSPagerView = {
        let table = FSPagerView()
        table.itemSize = CGSize(width: 292, height: 490)
        table.register(HomeCardCell.self, forCellWithReuseIdentifier:HomeCardCell.Identifiler )
        table.transformer = FSPagerViewTransformer(type: .linear)
        table.isInfinite = true
        table.interitemSpacing = 4
        return table
    }()
    
    override func configureUI() {
        super.configureUI()
        addSubview(cardTableView)
        
        cardTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
