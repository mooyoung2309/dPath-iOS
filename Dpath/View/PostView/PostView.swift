//
//  PostView.swift
//  Dpath
//
//  Created by sangheon on 2022/05/22.
//

import UIKit
import Then


class PostView: BasicView {
        
    let TitleField = UITextField().then {
        $0.placeholder = "글 제목을 입력해주세요."
        $0.font = .systemFont(ofSize: 16, weight: .light)
    }
    
    let dummyView1 = UIView().then {
        $0.backgroundColor = .gray
    }
    
    let peopleLabel = UILabel().then {
        $0.text = "인원 수"
    }
    
    let plusButton = UIButton().then {
        $0.setImage(UIImage(named: ImageName.plus), for: .normal)
    }
    
    let countLabel = UILabel().then {
        $0.text = "0"
    }
    
    let subtractButton = UIButton().then {
        $0.setImage(UIImage(named: ImageName.subtract), for: .normal)
    }
    
    let dummyView2 = UIView().then {
        $0.backgroundColor = .gray
    }
    
    let textView = UITextView().then {
        $0.text = "글을 입력해주세요."
    }
    
    override func configureUI() {
        super.configureUI()
        addSubview(TitleField)
        addSubview(dummyView1)
        addSubview(peopleLabel)
        addSubview(plusButton)
        addSubview(countLabel)
        addSubview(subtractButton)
        addSubview(dummyView2)
        addSubview(textView)
        
        
        TitleField.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(24)
            make.height.equalTo(46)
        }
        
        dummyView1.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.trailing.equalTo(TitleField)
            make.top.equalTo(TitleField.snp.bottom).offset(20)
        }
        
        peopleLabel.snp.makeConstraints { make in
            make.top.equalTo(dummyView1.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            peopleLabel.sizeToFit()
        }
        
        subtractButton.snp.makeConstraints { make in
            make.height.width.equalTo(24)
            make.trailing.equalToSuperview().inset(24)
            make.centerY.equalTo(peopleLabel)
        }
        
        countLabel.snp.makeConstraints { make in
            make.trailing.equalTo(subtractButton.snp.leading).offset(-12)
            make.centerY.equalTo(subtractButton)
            countLabel.sizeToFit()
        }
        
        plusButton.snp.makeConstraints { make in
            make.height.width.equalTo(24)
            make.trailing.equalTo(countLabel.snp.leading).offset(-12)
            make.centerY.equalTo(subtractButton)
        }
        
        dummyView2.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(plusButton.snp.bottom).offset(24)
            make.leading.trailing.equalTo(dummyView1)
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(dummyView2.snp.bottom)
            make.leading.trailing.equalTo(dummyView2)
            make.bottom.equalToSuperview()
        }
        
    }
   

}
