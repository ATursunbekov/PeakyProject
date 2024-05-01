//
//  NewsAPI.swift
//  PeakyProject
//
//  Created by Alikhan Tursunbekov on 30/4/24.
//

import Foundation
import Moya

enum NewsAPI {
    case getNews
    case getNextPage(page: String)
    case getSpecificNews(ids: [String])
}

extension NewsAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://newsdata.io/api/1")!
    }
    
    var path: String {
        return "/news"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .getNews:
            return .requestParameters(parameters: ["apikey": "pub_43143385c1758790159c4e2c113839fd48499"], encoding: URLEncoding.default)
        case .getNextPage(let page):
            return .requestParameters(parameters: ["apikey": "pub_43143385c1758790159c4e2c113839fd48499", "page": page], encoding: URLEncoding.default)
        case .getSpecificNews(let ids):
            let idsString = ids.joined(separator: ",")
            return .requestParameters(parameters: ["apikey": "pub_43143385c1758790159c4e2c113839fd48499", "id": idsString], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

