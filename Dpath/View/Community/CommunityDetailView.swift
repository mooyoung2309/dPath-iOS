//
//  CommunityDetailView.swift
//  Dpath
//
//  Created by sangheon on 2022/05/22.
//

import UIKit

class CommunityDetailView:BasicView {
    
    let cardView = CardView()
    let bottomView = CommunityDetailBottomView()
    
    let likeButton = UIButton().then {
        $0.setImage(UIImage(named: ImageName.thumbUp), for: .normal)
    }
    
    let shareButton = UIButton().then {
        $0.setImage(UIImage(named: ImageName.share), for: .normal)
    }
    
    override func configureUI() {
        super.configureUI()
        addSubview(bottomView)
        addSubview(cardView)
        
        bottomView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(Constant.screenHeight * 0.282)
        }
        
        cardView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(bottomView.snp.top)
        }
        updateCoverView()
    }
    
    private func updateCoverView() {
        cardView.likeButton.isHidden = true
        cardView.coverView.dateLabel.isHidden = true
        addSubview(likeButton)
        addSubview(shareButton)
        
        shareButton.snp.makeConstraints { make in
            make.top.trailing.equalTo(cardView.coverView).inset(16)
            make.height.width.equalTo(24)
        }
        
        likeButton.snp.makeConstraints { make in
            make.trailing.equalTo(shareButton.snp.leading).offset(-14)
            make.centerY.equalTo(shareButton)
            make.height.width.equalTo(24)
        }
        
        cardView.coverView.updateDateLabel.isHidden = false
    }

    
    
}
