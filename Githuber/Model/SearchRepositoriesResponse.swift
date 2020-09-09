//
//  SearchRepositoriesResponse.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

class SearchRepositoriesResponse: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [RepositoryItem]
    
    private enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
