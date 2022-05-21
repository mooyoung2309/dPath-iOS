//
//  CardView.swift
//  Dpath
//
//  Created by sangheon on 2022/05/21.
//

import UIKit

class CardView: BasicView {
    
    let cardImageView = UIImageView(image:UIImage(named: ImageName.Rectangle)).then {
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    let labelCoverView = UIView().then {
        $0.backgroundColor = .black
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 12
    }
    
    let dayCountLabel = UILabel().then {
        $0.text = "D-14"
        $0.font = .systemFont(ofSize: 12, weight: .bold)
        $0.textAlignment = .center
        $0.backgroundColor = .clear
        $0.textColor = .white
    }
    
    let likeButton = UIButton().then {
        $0.setImage(UIImage(named: ImageName.thumbUp), for: .normal)
    }
    
    let coverView = CoverView()
    
    override func configureUI() {
        super.configureUI()
        addSubview(cardImageView)
        addSubview(coverView)
        addSubview(labelCoverView)
        labelCoverView.addSubview(dayCountLabel)
        addSubview(likeButton)
        
        
        cardImageView.snp.makeConstraints { make in
//            make.leading.trailing.top.equalToSuperview()
//            make.bottom.equalTo(coverView.snp.top)
            make.edges.equalToSuperview()
        }
        
        coverView.snp.makeConstraints { make in
            make.trailing.leading.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.17)
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
        
        likeButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalTo(coverView.snp.top).offset(-10)
            make.height.width.equalTo(40)
        }
  
    }

}
