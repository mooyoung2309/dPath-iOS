//
//  NetWorkManager.swift
//  Dpath
//
//  Created by sangheon on 2022/05/22.
//

import Foundation
import Alamofire

class APIManager {

    func fetchFestival(idx:Int,completion:@escaping(Result<FestivalResponse, Error>) -> Void) {
        
        .responseJSON(completionHandler: { response in
            switch response.result {
            case .success(let value):
                do {
                    let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                    let coinEntities = try JSONDecoder().decode([CoingeckoEntity].self, from: data)
                    completion(coinEntities)
                } catch {
                    Log("JSON Parsing Error \(error)")
                }
                
            case .failure(let error):
                Log("response Error \(error)")
                break
            }
        })
        AF.request(FestivalTarget.getFestival(idx: idx)).responseDecodable { (response: AFDataResponse<FestivalResponse>) in
            switch response.result {
            case .success(let data):
                print(data)
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    
}
