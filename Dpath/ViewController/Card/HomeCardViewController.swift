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

class HomeCardViewController:BasicViewController {
    
    let viewModel = CardViewModel()
    let selfView = HomeCardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        getRoutineList()
        configure()
    }
    
   func getRoutineList() {
       let url = "http://dongmoo.shop:80/festivals?festivalIdx=21"
       // AF.request().responseJSON으로 호출하면 JSON형식의 response를 받는다.
       AF.request(url, method: .get).responseJSON { response in
           print("response: \(response)")
           // response의 데이터를 받을 [Routineee] 타입의 리스트 변수
           var routines: FestivalResponse
           do {
               let decoder = JSONDecoder()
               switch (response.result) {
               // 성공/실패 구분
               case .success:
                   // response의 data를 [Routineeee]로 변환
                   routines = try decoder.decode(FestivalResponse.self, from: response.data!)
                   print("routines: \(routines)")
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
    
    private func moveToNextNav() {
        let detail = CardDetailViewController()
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
}


extension HomeCardViewController: FSPagerViewDelegate,FSPagerViewDataSource  {

    func numberOfItems(in pagerView: FSPagerView) -> Int {
        10
    }

    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        guard let cell = pagerView.dequeueReusableCell(withReuseIdentifier: HomeCardCell.Identifiler, at: index) as? HomeCardCell else {
            return FSPagerViewCell()
        }

        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        moveToNextNav()
    }
}
