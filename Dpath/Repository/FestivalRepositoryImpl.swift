//
//  FestivalRepositoryImpl.swift
//  Dpath
//
//  Created by sangheon on 2022/05/24.
//

import Foundation
import RxSwift

class FestivalRepositoryImpl:FestivalRepository {
   
    
    let disposeBag = DisposeBag()
    private let festivalApi:APIManager
    
    required init(festvalApi: APIManager) {
        self.festivalApi = festvalApi
    }
    
    func fetchFestivalList() -> Single<FestivalListResponse> {
        Single<FestivalListResponse>.create { [weak self] single in
            self?.festivalApi.fetchFestivalList { result in
                switch result {
                case .success(let data):
                    single(.success(data))
                case .failure(let error):
                    print(error.localizedDescription)
                    single(.failure(error))
                }
            }

            return Disposables.create()
        }
    }
    
    
}
