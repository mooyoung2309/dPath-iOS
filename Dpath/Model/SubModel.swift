//
//  SubModel.swift
//  Dpath
//
//  Created by sangheon on 2022/05/22.
//

import Foundation


struct FestivalListResponse: Codable {
    let code: Int
    let isSuccess: Bool
    let message: String
    let result: Result
}

// MARK: - Result
struct Result: Codable {
    let festivalList: [FestivalList]
}

// MARK: - FestivalList
struct FestivalList: Codable {
    let date, endDate: String
    let festivalIdx: Int
    let festivalName, imgURL, themeName, univName: String

    enum CodingKeys: String, CodingKey {
        case date, endDate, festivalIdx, festivalName
        case imgURL = "imgUrl"
        case themeName, univName
    }
}
