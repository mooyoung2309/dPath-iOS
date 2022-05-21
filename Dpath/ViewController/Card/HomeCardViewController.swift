//
//  HomeCardViewController.swift
//  Dpath
//
//  Created by sangheon on 2022/05/21.
//

import UIKit
import FSPagerView
import SnapKit

class HomeCardViewController:UIViewController {
    
    let selfView = HomeCardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selfView.cardTableView.delegate = self
        selfView.cardTableView.dataSource = self
        view.addSubview(selfView)
        selfView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}


extension HomeCardViewController: FSPagerViewDelegate,FSPagerViewDataSource  {

    func numberOfItems(in pagerView: FSPagerView) -> Int {
        10
    }

    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        guard let cell = pagerView.dequeueReusableCell(withReuseIdentifier: HomeCardCell.Identifiler, at: index) as? HomeCardCell else {
            fatalError("Sliding cell die..")
        }

        return cell
    }

}
