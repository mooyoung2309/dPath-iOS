//
//  FestivalTarget.swift
//  Dpath
//
//  Created by sangheon on 2022/05/22.
//

import Alamofire
import Foundation

enum FestivalTarget {
    case getFestival(idx:Int)
    case getFestivalList
    case getRecord(idx:Int)
    case postRecord(request:PostRequest)
}

extension FestivalTarget: TargetType {
    var baseURL: String {
      return "http://dongmoo.shop:80"
    }

    var method: HTTPMethod {
        switch self {
        case .getFestival: return .get
        case .getFestivalList: return .get
        case .getRecord: return .get
        case .postRecord: return .post
        default:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getFestival: return "/festivals"
        case .getFestivalList: return "/festivals/lists"
        case .getRecord(let idx): return "/postings/\(idx)"
        case .postRecord: return "/postings"
        }
    }

    var parameters: RequestParams? {
        switch self {
        case .getFestival(let idx): return .query(idx)
        case .postRecord(let request): return .body(request)
        default:
            return nil
        }
    }
}

