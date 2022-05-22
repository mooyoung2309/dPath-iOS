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
    
    let viewModel = CardViewModel()
    let selfView = HomeCardView()
    let disposeBag = DisposeBag()
    var curLists:FestivalListResponse? {
        didSet {
            self.selfView.cardTableView.reloadData()
        }
    }
    
    let logoView = UIImageView(image: UIImage(named: "Frame1")).then {
        $0.contentMode = .scaleAspectFill
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRoutineList()
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
    
    func getRoutineList() {
        let url = "http://dongmoo.shop:80/festivals/lists"
        // AF.request().responseJSON으로 호출하면 JSON형식의 response를 받는다.
        AF.request(url, method: .get).responseJSON { response in
            print("response: \(response)")
            // response의 데이터를 받을 [Routineee] 타입의 리스트 변수
            var routines:FestivalListResponse
            do {
                let decoder = JSONDecoder()
                switch (response.result) {
                    // 성공/실패 구분
                case .success:
                    // response의 data를 [Routineeee]로 변환
                    routines = try decoder.decode(FestivalListResponse.self, from: response.data!)
                    print("routines: \(routines)")
                    self.curLists = routines
                case .failure(let error):
                    print("errorCode: \(error._code)")
                    print("errorDescription: \(error.errorDescription!)")
                }
            } catch let parsingError {
                print("Error:", parsingError)
            }
        }.resume()
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
        curLists?.result.festivalList.count ?? 0
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        guard let cell = pagerView.dequeueReusableCell(withReuseIdentifier: HomeCardCell.Identifiler, at: index) as? HomeCardCell else {
            return FSPagerViewCell()
        }
        guard let data = curLists?.result.festivalList[index] else { return FSPagerViewCell() }
        cell.configure(with:data)
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        guard let data = curLists?.result.festivalList[index] else { return }
        moveToNextNav(data: data)
    }
}
