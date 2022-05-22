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
    var posting: Posting!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(posting: Posting) {
        super.init(nibName: nil, bundle: nil)
        self.posting = posting
        selfView.cardView.cardImageView.setImage(with: posting.imgUrl)
        selfView.cardView.coverView.titleLabel.text = posting.themeName
        selfView.cardView.coverView.schoolNameLabel.text = posting.univName
        selfView.cardView.coverView.schoolFestivalLabel.text = posting.postingName
        selfView.bottomView.labelView.text = posting.content
        selfView.bottomView.chatOpenButton.setTitle("1/\(posting.personNum)명 채팅방 참여", for: .normal)
        selfView.cardView.dayCountLabel.text = "D-\(Int.random(in: 0..<50))"
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
                let vc = ChatViewController(posting: self.posting)
                self.navigationController?.pushViewController(vc, animated: true)
            }).disposed(by: disposeBag)
    }
}
