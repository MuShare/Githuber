//
//  SearchManager.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import RxSwift

final class SearchManager {
    static let shared = SearchManager()
    
    private init() {}
    
    func searchRepo(keyword: String) -> Single<[RepositoryItem]> {
        return SearchRepository.shared.searchRepo(keyword: keyword)
    }
    
}
