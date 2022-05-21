//
//  CardDetailViewController.swift
//  Dpath
//
//  Created by sangheon on 2022/05/21.
//

import UIKit
import Then
import RxSwift
import RxCocoa

class CardDetailViewController: BasicViewController {
    
    let disposeBag = DisposeBag()
    let selfView = CardDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
        setBind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    private func configure() {
        view.addSubview(selfView)
        selfView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-18)
        }
    }
    
    private func setBind() {
        selfView.bottomButton.rx.tap
            .asDriver()
            .drive(onNext: {
               let vc = PostViewController()
               self.navigationController?.pushViewController(vc, animated: true)
            }).disposed(by: disposeBag)
    }
 }


