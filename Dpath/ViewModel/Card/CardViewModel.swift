//
//  CardViewModel.swift
//  Dpath
//
//  Created by sangheon on 2022/05/22.
//

import Foundation
import RxSwift

class CardViewModel:BasicViewModel {
    
    let usecase:FestivalUseCase

    struct Output {
        let festivalData = PublishSubject<FestivalListResponse>()
       }
    
    func fetchData() {
    }
    
    init(usecase:FestivalUseCase) {
        self.usecase = usecase
    }
    
}
