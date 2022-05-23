//
//  NetWorkManager.swift
//  Dpath
//
//  Created by sangheon on 2022/05/22.
//

import Foundation
import Alamofire
import RxSwift

class APIManager {
    func fetchFestivalList(completion:@escaping (Result<FestivalListResponse,Error>) -> Void) {
        AF.request(FestivalTarget.getFestivalList).responseDecodable { (response: AFDataResponse<FestivalListResponse>) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
}
