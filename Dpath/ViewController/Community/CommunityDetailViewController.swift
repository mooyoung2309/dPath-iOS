//
//  CommunityDetailViewController.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/21.
//

import UIKit
import RxCocoa
import RxSwift

class CommunityDetailViewController: UIViewController {
    
    var postId: Int!
    let disposeBag = DisposeBag()
    let selfView = CommunityDetailView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(postId: Int) {
        super.init(nibName: nil, bundle: nil)
        self.postId = postId
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        setBind()
    }
    
    private func configureUI() {
        view.addSubview(selfView)
        selfView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
    private func setBind() {
        selfView.bottomView.chatOpenButton.rx.tap
            .asDriver()
            .drive(onNext: {
                let vc = ChatViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }).disposed(by: disposeBag)
    }
}
