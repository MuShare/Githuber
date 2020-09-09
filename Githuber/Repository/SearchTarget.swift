//
//  SearchTarget.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import Moya

enum SearchTarget {
    case searchRepo(String)
}

extension SearchTarget: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.github.com") else {
            fatalError("error when init baseURL")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .searchRepo:
            return "/search/repositories"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var sampleData: Data {
         Data()
    }
    
    var task: Task {
        switch self {
        case .searchRepo(let keyword):
            return .requestParameters(
                parameters: [
                    "q": keyword
                ],
                encoding: URLEncoding.default
            )
        }
    }
    
    var headers: [String : String]? {
        nil
    }
    
}
