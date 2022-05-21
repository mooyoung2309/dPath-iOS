//
//  BottomSheetView.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/21.
//

import UIKit

class BottomSheetView: UIView {
    var divider = UIView()
    var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.text = "4.4월"
    }
    var hideButton = UIButton().then {
        $0.setBackgroundImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        
    }
}

extension BottomSheetView {
    func update() {

    }
    
    func setView() {
        backgroundColor = UIColor.white
        addSubview(divider)
        addSubview(titleLabel)
        addSubview(hideButton)
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        hideButton.tintColor = UIColor.systemGray3
        
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: topAnchor),
            divider.leadingAnchor.constraint(equalTo: leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 0.5),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            hideButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            hideButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            hideButton.widthAnchor.constraint(equalToConstant: 50),
            hideButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
