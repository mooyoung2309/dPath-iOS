//
//  PostViewController.swift
//  Dpath
//
//  Created by sangheon on 2022/05/22.
//

import UIKit

class PostViewController: BasicViewController {

    let selfView = PostView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    private func configureUI() {
        view.addSubview(selfView)
        
        selfView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

}
