//
//  CardDetailView.swift
//  Dpath
//
//  Created by sangheon on 2022/05/21.
//

import UIKit
import Then

class CardDetailView: BasicView {
    
    let selfView = CardView()
    
    let bottomButton = UIButton().then {
        $0.backgroundColor = .black
        $0.setTitle("모임 만들기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 14
    }
    
    let likeButton = UIButton().then {
        $0.setImage(UIImage(named: ImageName.thumbUp), for: .normal)
    }
    
    let shareButton = UIButton().then {
        $0.setImage(UIImage(named: ImageName.share), for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
        updateCoverView()
    }
    
    override func configureUI() {
        addSubview(selfView)
        addSubview(bottomButton)
        
        bottomButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(56)
            make.bottom.equalToSuperview()
        }
        
        selfView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalTo(bottomButton.snp.top).offset(-30)
        }
    }
    
    private func updateCoverView() {
        selfView.likeButton.isHidden = true
        selfView.coverView.dateLabel.isHidden = true
        addSubview(likeButton)
        addSubview(shareButton)
        
        
        shareButton.snp.makeConstraints { make in
            make.top.trailing.equalTo(selfView.coverView).inset(16)
            make.height.width.equalTo(24)
        }
        
        likeButton.snp.makeConstraints { make in
            make.trailing.equalTo(shareButton.snp.leading).offset(-14)
            make.centerY.equalTo(shareButton)
            make.height.width.equalTo(24)
        }
        
        selfView.coverView.updateDateLabel.isHidden = false
    }
    
}
