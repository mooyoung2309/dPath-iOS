//
//  File.swift
//  Dpath
//
//  Created by sangheon on 2022/05/23.
//

import Foundation
import RxSwift

class FestivalUseCase {
    private let festivalRepository: FestivalRepository
    
    init(festivalRepository: FestivalRepository) {
        self.festivalRepository = festivalRepository
    }
    
    func fetchFestivalList() -> Single<FestivalListResponse> {
        return festivalRepository.fetchFestivalList()
    }
}
