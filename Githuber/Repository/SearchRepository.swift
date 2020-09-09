//
//  SearchRepository.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import RxSwift

final class SearchRepository: BaseRepository<SearchTarget> {
    
    static let shared = SearchRepository()
    
    private override init() {}
    
    func searchRepo(keyword: String) -> Single<[RepositoryItem]> {
        return provider.rx.request(.searchRepo(keyword))
            .map(SearchRepositoriesResponse.self)
            .map { $0.items }
    }
    
}
