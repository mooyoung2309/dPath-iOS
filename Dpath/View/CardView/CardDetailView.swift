//
//  CardDetailView.swift
//  Dpath
//
//  Created by sangheon on 2022/05/21.
//

import UIKit
import Then

class CardDetailView: BasicView {

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
   
    let likeButton = UIButton().then {
       // $0.setImage(UIImage(named:""), for: .normal)
        $0.backgroundColor = .red
    }
    
    private let coverView = CoverView().then {
        $0.backgroundColor = .yellow
    }
    
    override func configureUI() {
        super.configureUI()
        addSubview(coverView)
        addSubview(cardImageView)
        addSubview(labelCoverView)
        labelCoverView.addSubview(dayCountLabel)
        addSubview(likeButton)
        
        coverView.snp.makeConstraints { make in
            make.trailing.leading.bottom.equalToSuperview()
            make.height.equalTo(self.height * 0.17)
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
        
        likeButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalTo(coverView.snp.top).offset(-10)
            make.height.width.equalTo(40)
        }
        
    }
    

}
