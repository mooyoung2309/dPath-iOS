//
//  CardViewModel.swift
//  Dpath
//
//  Created by sangheon on 2022/05/22.
//

import Foundation
import RxSwift

class CardViewModel:BasicViewModel {
    
    let festivalData = PublishSubject<FestivalResponse>()
    //let currentFestivalData:FestivalResponse?
    let apiManager = APIManager()
    
    func fetchData() {
//        apiManager.fetchFestival(idx: 21) { response in
//            switch response {
//            case .success(let data):
//                print(data)
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
    override init() {
        
    }
    
}
