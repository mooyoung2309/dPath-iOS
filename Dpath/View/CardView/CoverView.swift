//
//  CoverView.swift
//  Dpath
//
//  Created by sangheon on 2022/05/21.
//

import UIKit

class CoverView: UIView {
    
     let titleLabel:UILabel = {
       let label = UILabel()
        label.tintColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "DAY 10"
        return label
    }()
    
     let createdDate:UILabel = {
       let label = UILabel()
        label.tintColor = .black
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.text = "97.04.01"
        return label
    }()
    
     let postText:UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14, weight: .regular)
        textView.text = "오늘이 드디어 스위스 여행 마지막 날. 흑흑 슬프다. 하지만 오늘도 스위스의 하늘은 정말 너무 예쁘다. 다시 또 올 수 있기를 :)"
        textView.tintColor = .lineColor
        textView.isEditable = false
        return textView
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(titleLabel)
        self.addSubview(createdDate)
        self.addSubview(postText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
    
    
    private func configureUI() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(22)
            make.left.equalToSuperview().inset(18)
            make.right.equalToSuperview().inset(190)
            make.height.equalTo(20)
        }
        
        createdDate.snp.makeConstraints { make in
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalTo(titleLabel.snp.right)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.height.equalTo(18)
        }
        
        postText.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(18)
            make.right.equalToSuperview().inset(40)
            make.top.equalTo(createdDate.snp.bottom).offset(12)
            make.bottom.equalToSuperview().inset(12)
        }
    }
}
