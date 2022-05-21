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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                print("go next page")
            }).disposed(by: disposeBag)
    }
}
