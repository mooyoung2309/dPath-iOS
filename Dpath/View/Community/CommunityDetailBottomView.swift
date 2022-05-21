//
//  CommunityDetailBottomView.swift
//  Dpath
//
//  Created by sangheon on 2022/05/22.
//

import UIKit
import Then

class CommunityDetailBottomView: BasicView {
    
    let topView = UIView()
    
    let profileImageView = UIImageView(image:UIImage(named:ImageName.person)).then {
        $0.contentMode = .scaleAspectFill
    }
    
    let nickNamLabel = UILabel().then {
        $0.text = "닉네임입니다"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    
    let middleView = UIView()
    
    let labelView = UILabel().then {
        $0.text = "dummydummydummydummydummydummydummydummydummydummydummydummydummydummydummydummydummydummydummydummydummydummydummydummydummydummydummydummydummydummy"
        $0.numberOfLines = 3
        $0.font = .systemFont(ofSize: 16, weight: .light)
    }
    
    let watchedLabel = UILabel().then {
        $0.text = "조회수 293"
        $0.font = .systemFont(ofSize: 12, weight: .light)
    }
    
    let chatOpenButton = UIButton().then {
        $0.backgroundColor = .whiteRedColor
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("채팅방 입장 (1/3)", for: .normal)
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 14
    }
    
    let dummyView1 = UIView().then {
        $0.backgroundColor = .gray
    }
    
    let dummyView2 = UIView().then {
        $0.backgroundColor = .gray
    }
    
    override func configureUI() {
        super.configureUI()
        setTopViewContraint()
        setMiddleViewContraint()
        // set TopView
        addSubview(topView)
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(54)
        }
        
        //set lastButton
        addSubview(chatOpenButton)
        chatOpenButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-18)
            make.height.equalTo(60)
        }
        
        //set MiddleView
        addSubview(middleView)
        middleView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(chatOpenButton.snp.top).offset(-16)
        }
        setCircleImageView()
    }
    
    private func setTopViewContraint() {
        topView.addSubview(profileImageView)
        topView.addSubview(nickNamLabel)
        middleView.addSubview(dummyView1)
        middleView.addSubview(dummyView2)
        
        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(38)
        }
        
        nickNamLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
            nickNamLabel.sizeToFit()
        }
        
        dummyView1.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        dummyView2.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
    }
    
    private func setMiddleViewContraint() {
        middleView.addSubview(labelView)
        middleView.addSubview(watchedLabel)
        
        watchedLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            watchedLabel.sizeToFit()
        }
        
        labelView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(12)
            make.bottom.equalTo(watchedLabel.snp.top)
            
        }
    }
    
    private func setCircleImageView() {
        profileImageView.layoutIfNeeded()
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.height / 2
    }
}
