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
    
    private let slidingTableView:FSPagerView = {
        let table = FSPagerView()
        table.itemSize = CGSize(width: 292, height: 580)
        //table.register(SlidingCell.self, forCellWithReuseIdentifier:SlidingCell.Identifiler )
        table.transformer = FSPagerViewTransformer(type: .linear)
        table.isInfinite = true
        table.interitemSpacing = 4
        return table
    }()
    
    override func configureUI() {
        super.configureUI()
        
        slidingTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
