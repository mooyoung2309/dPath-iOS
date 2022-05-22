//
//  Model.swift
//  Dpath
//
//  Created by sangheon on 2022/05/22.
//

import Foundation


// MARK: - Festival
struct FestivalResponse: Codable {
    let code: Int
    let isSuccess: Bool
    let message: String
    let result: Festival
}

// MARK: - Result
struct Festival: Codable {
    let festivalIdx: Int
    let startDate, endDate, univName, location: String
    let festivalName, themeName: String
    let imgURL: String
    
    enum CodingKeys: String, CodingKey {
        case festivalIdx, startDate, endDate, univName, location, festivalName, themeName
        case imgURL = "imgUrl"
    }
}


// MARK: - ImgURL
//struct ImgURL: Codable {
//    let imgURL: String
//    let imgURLIdx: Int
//
//    enum CodingKeys: String, CodingKey {
//        case imgURL = "imgUrl"
//        case imgURLIdx = "imgUrlIdx"
//    }
//}


struct PostRequest: Codable {
    let content: String
    let festivalIdx, personNum, postingIdx: Int
    let postingName: String
}

struct PostResponse: Codable {
    let code: Int
    let isSuccess: Bool
    let message: String
    let result: [Posting]
}

struct Posting: Codable {
    let postingIdx: Int
    let content: String
    let festivalIdx: Int
    let personNum: Int
    let postingName: String
    let imgUrl: String
    let themeName: String
    let univName: String
    let startDate: String
    let endDate: String
}
