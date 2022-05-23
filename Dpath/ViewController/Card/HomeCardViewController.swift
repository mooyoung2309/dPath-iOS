//
//  HomeCardViewController.swift
//  Dpath
//
//  Created by sangheon on 2022/05/21.
//

import UIKit
import FSPagerView
import SnapKit
import Alamofire
import RxSwift
import RxRelay
import Then

class HomeCardViewController:BasicViewController {
    
    let viewModel:CardViewModel
    let selfView = HomeCardView()
    
    let logoView = UIImageView(image: UIImage(named: "Frame1")).then {
        $0.contentMode = .scaleAspectFill
    }
    
    init(viewModel:CardViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setImageView()
    }
    
    func setImageView() {
        view.addSubview(logoView)
        logoView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(26)
            make.width.equalTo(180)
            make.centerX.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func configure() {
        selfView.cardTableView.delegate = self
        selfView.cardTableView.dataSource = self
        view.addSubview(selfView)
        selfView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func moveToNextNav(data:FestivalList) {
        let detail = CardDetailViewController(data: data)
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
}


extension HomeCardViewController: FSPagerViewDelegate,FSPagerViewDataSource  {
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        viewModel.currentFestivalList.festivalList.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        guard let cell = pagerView.dequeueReusableCell(withReuseIdentifier: HomeCardCell.Identifiler, at: index) as? HomeCardCell else {
            return FSPagerViewCell()
        }
        let data = viewModel.currentFestivalList.festivalList[index]
        cell.configure(with:data)
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        let data = viewModel.currentFestivalList.festivalList[index]
        moveToNextNav(data: data)
    }
}
