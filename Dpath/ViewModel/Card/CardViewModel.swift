//
//  CardViewModel.swift
//  Dpath
//
//  Created by sangheon on 2022/05/22.
//

import Foundation
import RxSwift

class CardViewModel:BasicViewModel {
    
    let festivalList = PublishSubject<FestivalListResponse>()
    var currentFestivalList:FestivalListResult = .init(festivalList: [])
    let errorMessage = BehaviorSubject<String>(value: "")
    let usecase:FestivalUseCase

    
    func fetchData() {
        usecase.fetchFestivalList()
            .subscribe({ [weak self] event in
                switch event {
                case .success(let data):
                    self?.festivalList.onNext(data)
                    self?.currentFestivalList = data.result
                case .failure(let error):
                    self?.errorMessage.onNext(error.localizedDescription)
                }
            }).disposed(by: disposeBag)
    }
    
    init(usecase:FestivalUseCase) {
        self.usecase = usecase
    }
    
}
