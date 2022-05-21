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
    let date, endDate: String
    let festivalIdx: Int
    let festivalName: String
    let imgUrls: [ImgURL]
    let location, themeName, univName: String
}

// MARK: - ImgURL
struct ImgURL: Codable {
    let imgURL: String
    let imgURLIdx: Int

    enum CodingKeys: String, CodingKey {
        case imgURL = "imgUrl"
        case imgURLIdx = "imgUrlIdx"
    }
}


struct PostRequest: Codable {
    let content: String
    let festivalIdx, personNum, postingIdx: Int
    let postingName: String
}

struct PostResponse: Codable {
       let code: Int
       let isSuccess: Bool
       let message: String
       let result: Index
}

struct Index: Codable {
    let postingIdx: Int
}

