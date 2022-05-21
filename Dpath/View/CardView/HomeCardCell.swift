//
//  HomeCardCell.swift
//  Dpath
//
//  Created by sangheon on 2022/05/21.
//

import UIKit
import FSPagerView
import SnapKit

class HomeCardCell:FSPagerViewCell {
    static let Identifiler = "HomeCardCell"
    
    private let slidingImageView:UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "crop"))
        return imageView
    }()
    
    private let coverView:CoverView = {
       let view = CoverView()
        view.backgroundColor = .systemGroupedBackground
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = .gray
        contentView.addSubview(coverView)
        contentView.addSubview(slidingImageView)
        configureUI()

    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func configureUI() {
        coverView.snp.makeConstraints { make in
            make.right.left.bottom.equalToSuperview()
            make.height.equalTo(contentView.height/3.2)
        }
        
        slidingImageView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.bottom.equalTo(coverView.snp.top)
        }
    }
    
//    func configure(with model:) {
//
//    }
}
