//
//  CircleTagView.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/21.
//

import UIKit
import Then

class CircleTagView: UIView {
    
    var circleView = UIView().then {
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 3
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }
    
    init(color: UIColor) {
        super.init(frame: .zero)
        setView()
        circleView.backgroundColor = color
    }
}

extension CircleTagView {
    func setView() {
        addSubview(circleView)
        
        circleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: topAnchor),
            circleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            circleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            circleView.bottomAnchor.constraint(equalTo: bottomAnchor),
            circleView.widthAnchor.constraint(equalToConstant: 6),
            circleView.heightAnchor.constraint(equalToConstant: 6),
            
        ])
    }
}
