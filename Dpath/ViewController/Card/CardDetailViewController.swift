//
//  CardDetailViewController.swift
//  Dpath
//
//  Created by sangheon on 2022/05/21.
//

import UIKit

class CardDetailViewController: UIViewController {

    let selfView = CardView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.addSubview(selfView)
        selfView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
}
