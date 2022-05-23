//
//  FestivalRepository.swift
//  Dpath
//
//  Created by sangheon on 2022/05/23.
//

import Foundation
import RxSwift

protocol FestivalRepository {
    init(festvalApi: APIManager)
    func fetchFestivalList() -> Single<FestivalListResponse>
}
