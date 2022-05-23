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
    let data:FestivalList
    
    init(data:FestivalList) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
        setBind()
        configureModel()
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
    
    func configureModel() {
        selfView.selfView.cardImageView.setImage(with: data.imgURL)
        selfView.selfView.coverView.schoolFestivalLabel.text = data.festivalName
        selfView.selfView.coverView.schoolNameLabel.text = data.univName
        selfView.selfView.coverView.titleLabel.text = data.festivalName
        selfView.selfView.coverView.dateLabel.text = data.date
    }
 }


