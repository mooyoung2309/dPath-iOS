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
    static let apiManager = APIManager()
    init() {}
    
    func getRoutineList() -> Single<FestivalListResponse> {
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
                        
                case .failure(let error):
                    print("errorCode: \(error._code)")
                    print("errorDescription: \(error.errorDescription!)")
                }
            } catch let parsingError {
                print("Error:", parsingError)
            }
        }.resume()
    }
    
}
