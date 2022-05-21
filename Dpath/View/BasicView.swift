//
//  BaseView.swift
//  Dpath
//
//  Created by sangheon on 2022/05/21.
//

import Foundation

import UIKit

class BasicView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureUI() {
        self.backgroundColor = .systemBackground
    }
}
